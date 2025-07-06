#!/bin/bash
#
current_url=$(playerctl --player=spotify metadata | grep mpris:artUrl | awk '{print $3 }')
curl $current_url > /home/iwuvu/.config/eww/scripts/image.png
eww_art_exist=$(eww active-windows | grep dashboard-art | awk '{print $2 }')
if [ $eww_art_exist == "dashboard-art" ]; then
  echo "/home/iwuvu/.config/eww/scripts/image.png"
fi

