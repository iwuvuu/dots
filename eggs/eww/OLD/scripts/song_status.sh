#!/bin/bash
#
song_status=$(playerctl --player=spotify status)
if [ $song_status == "Playing" ]; then
  echo ""
else
  echo ""
fi
