#!/bin/bash

winman=$(wmctrl -m | grep Name: | awk '{print $2}')

if [ $winman == "qtile" ]; then
  current_layout=$(qtile cmd-obj -o layout -f info | grep name | awk '{print $NF}' | tr -cd '[:alnum:]')
  my_cool_layout="qtile cmd-obj -o cmd -f next_layout"
  if [ $current_layout == "ratiotile" ]; then
    layout_icon="󰨤"
  elif [ $current_layout == "monadtall" ]; then
    layout_icon=""
  elif [ $current_layout == "matrix" ]; then
    layout_icon="󰋁"
  elif [ $current_layout == "floating" ]; then
    layout_icon="󱂬"
  fi

elif [ $winman == "awesome" ]; then
  current_layout=$(awesome-client 'return mouse.screen.selected_tag.layout.name' | awk '{print $NF}' | tr -d '"')
  layout_command="awesome-client 'awful.layout.inc(1)'"
  if [ $current_layout == "tile" ]; then
    layout_icon=""
  elif [ $current_layout == "floating" ]; then
    layout_icon="󱂬"
  elif [ $current_layout == "magnifier" ]; then
    layout_icon="󱡴"
  elif [ $current_layout == "spiral" ]; then
    layout_icon="󰑨"
  elif [ $current_layout == "fairv" ]; then
    layout_icon="󰋁"
  fi
fi


echo "(button :tooltip '$current_layout' :onclick \"$layout_command\" '$layout_icon')"
#echo $current_layout
#echo "(button :tooltip '$current_layout' :onclick 'kitty' '$layout_icon')"
#echo $winman
