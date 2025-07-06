#!/bin/bash

eww_art_exist=$(eww active-windows | grep dashboard-art | awk '{print $2 }')
if [ $eww_art_exist == "dashboard-art" ]; then
  echo "/home/iwuvu/.config/eww/scripts/image.png"
fi

