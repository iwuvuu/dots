#!/bin/sh

case "$1" in 
  --up)
    #echo "up"
    wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+
    ;;

  --down)
    #echo "down"
    wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%-
    ;;
esac
