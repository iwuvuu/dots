#!/usr/bin/env bash

# define colors
colors=("#FFFFFF" "#fab387" "#a6e3a1" "#89b4fa") # Active Workspaces
dimmed=("rgba(154,152,162,0.7)" "#f9e2af" "#94e2d5" "#b4befe") # Inactive workspaces
empty='empty' # Empty workspaces

# get initial focused workspace
focusedws=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')

declare -A o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0 [10]=0)
declare -A monitormap
declare -A workspaces

# set color for each workspace
status() {
  if [ "${o[$1]}" -eq 1 ]; then 
    mon=${monitormap[${workspaces[$1]}]}
    echo -n "true"
  else
    echo -n "false"
  fi
}

status_activity() {
  if [ "${o[$1]}" -eq 1 ]; then 
    mon=${monitormap[${workspaces[$1]}]}

    if [ $focusedws -eq "$1" ]; then
      echo -n "active"
    else
      echo -n "inactive"
    fi
  else
    echo -n "empty"
  fi
}

# handle workspace create/destroy
workspace_event() {
  if (( $1 <= 10 )); then
    o[$1]=$2
    while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jq -r '.[]|"\(.id) \(.monitor)"')
  fi
  if [ "$2" == "0" ]; then
    unset "workspaces[$1]"
  fi
}
# handle monitor (dis)connects
monitor_event() {
  while read -r k v; do monitormap["$k"]=$v; done < <(hyprctl -j monitors | jq -r '.[]|"\(.name) \(.id) "')
}

# generate the json for eww
generate() {
  echo -n '['

  for i in {1..10}; do
    echo -n ''$([ $i -eq 1 ] || echo ,)'{"num":"'$i'","haswins":"'$(status "$i")'"}'
  done

  echo ']'
}

# setup

# add monitors
monitor_event

# add workspaces
while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jq -r '.[]|"\(.id) \(.monitor)"')

# check occupied workspaces
for num in "${!workspaces[@]}"; do
  o[$num]=1
done
# generate initial widget
generate

if [ "$1" == "--once" ]; then
  exit
fi

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r line; do
  # echo "${#workspaces[@]} ${#o[@]}"
  # echo $line
  case ${line%>>*} in
    "focusedmon")
      focusedws=${line#*,}
      generate
      ;;
    "createworkspace")
      # workspace_event "${line#*>>}" 1
      o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0 [10]=0)
      workspaces=()
      # add workspaces
      while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jq -r '.[]|"\(.id) \(.monitor)"')
      # check occupied workspaces
      for num in "${!workspaces[@]}"; do
        o[$num]=1
      done
      # focusedws=${line#*>>}
      generate
      ;;
    "movewindow")
      generate
      ;;
    "destroyworkspace")
      # workspace_event "${line#*>>}" 0
      o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0 [10]=0)
      workspaces=()
      # add workspaces
      while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jq -r '.[]|"\(.id) \(.monitor)"')
      # check occupied workspaces
      for num in "${!workspaces[@]}"; do
        o[$num]=1
      done
      generate
      ;;
    "monitor"*)
      monitor_event
      generate
      ;;
  esac
  # echo $line
  # generate
done

# main loop
# socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | rg --line-buffered "workspace|mon(itor)?" | while read -r line; do
#   case ${line%>>*} in
#     "workspace")
#       focusedws=${line#*>>}
#       generate
#       ;;
#     "focusedmon")
#       focusedws=${line#*,}
#       generate
#       ;;
#     "createworkspace")
#       workspace_event "${line#*>>}" 1
#       focusedws=${line#*>>}
#       # generate
#       ;;
#     "destroyworkspace")
#       workspace_event "${line#*>>}" 0
#       generate
#       ;;
#     "monitor"*)
#       monitor_event
#       generate
#       ;;
#   esac
# done
