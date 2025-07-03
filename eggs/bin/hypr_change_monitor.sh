#! /bin/sh

#User variables
hyprdir="/home/$USER/.config/hypr/"
hyprfile="monitors.conf"

#This script should open a rofi window and ask what settings does the user want to use 
#Available settings: default (integrated monitor + highrr); custom (opens second window)

#Second window (custom)
#list active monitors; upon selecting a monitor a second window should show up with settings used by the curent monitor

#selected option should by applied to enclosed monitor config file
firstwindow(){
eww update currMonitor="$(hyprctl monitors | sed -n "/Monitor/{p}")"
eww update currMonSize="$(hyprctl monitors | sed -n "/Monitor/{n; p}" | tr -d "	")"
rofiselect=$(echo -e "Default\nCustom" | rofi -dmenu -p "Select an option")
if [[ $rofiselect == "q" || $rofiselect == "" ]]; then
  exit
elif [[ $rofiselect == "Default" ]]; then
  echo "default"
else
  roficustom
fi
}


roficustom(){
#this outputs current monitors
monitors=$(hyprctl monitors | awk '/Monitor/ {print $2}')
rofimonitors=$(echo -e "$monitors" | rofi -dmenu -p "")
if [[ $rofimonitors == "q" || $rofimonitors == "" ]]; then
  exit
else
  settings=$(hyprctl monitors | sed -n "/$rofimonitors/{n; n; n; n; n; n; n; n; n; n; n; n; n; n; n; n; n; n; n; n; p}" | tr -d "	availableModes: z" | tr 'H' '\n')
  rofisettings=$(echo -e "$settings" | rofi -dmenu -p "")
  if [[ $rofisettings == "q" || $rofisettings == "" ]]; then
    exit
  else
    sed -i "s|monitor = $rofimonitors, .*|monitor = $rofimonitors, $rofisettings, auto, 1|g" $hyprdir$hyprfile
    eww update currMonitor="$(hyprctl monitors | sed -n "/Monitor/{p}")"
		# To update monitor bars
		eww kill
		eww open-many bar bar2 shadowBar shadowBar2
  fi
fi
#sed -i "s|monitor = $rofimonitors, .*|monitor = $rofimonitors, $rofisettings, auto, 1|g" $hyprdir$hyprfile 
}

firstwindow
