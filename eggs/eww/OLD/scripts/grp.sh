#!/usr/bin/env bash

gib_workspace_names() {
  wmctrl -d | awk '{if ( NR <= 6 ) { print $1 " " $2 " " $9 }}' 
}

gib_workspace_yuck() {
  buffered=""
  gib_workspace_names | while read -r id active name; do
    name="${name#*_}"
    if [ "$active" == '*' ]; then
      active_class="active"
    else
      active_class="inactive"
    fi

    if wmctrl -l | grep --regexp '.*\s\+'"$id"'\s\+.*' >/dev/null; then
      button_class="occupied"
      button_name=""
    else
      button_class="empty"
      button_name=""
    fi
    buffered+="(button :class \"$button_class $active_class\"  :onclick \"wmctrl -s $id && update.sh\" \"$button_name\")"
      echo -n "$buffered"
      buffered=""
  done
}


box_attrs=':orientation "v" :class "mybar-tags" :halign "center"'
echo "(box $box_attrs $(gib_workspace_yuck))"
#echo $(gib_workspace_yuck)
#eww update mytag="(box $box_attrs $(gib_workspace_yuck) )"
#echo $name
#echo $active

