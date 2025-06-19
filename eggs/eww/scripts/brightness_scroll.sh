#!/bin/sh

case "$1" in 
  --up)
    #echo "up"
    brightnessctl s +1%
    ;;

  --down)
    #echo "down"
    brightnessctl s 1%-
    ;;
esac
