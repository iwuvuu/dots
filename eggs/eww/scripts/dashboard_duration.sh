#!/bin/bash

### For current position in a song
# get current position in seconds in float
current_position=$(playerctl --player=spotify position)
current_seconds=${current_position%%"."*}
current_minutes=$(awk "BEGIN {print $current_seconds / 60}")
current_minutes2=$(printf "%0.2f\n" $current_minutes)

left_current=${current_minutes%%"."*}
right_current=${current_minutes2#*"."}

current_final_seconds=$(awk "BEGIN {print $right_current * 6}")
if [ $current_final_seconds -lt 100 ]; then
  current_final_seconds="0$current_final_seconds"
fi
c_f_s_c="${current_final_seconds:0:2}"
current_final_position="$left_current:$c_f_s_c"

### For full length of a song
# get song length in X:Y format
song_length=$(playerctl metadata --format '{{ duration(mpris:length) }}')
# devide part before ":" and after
left_song=${song_length%%":"*}
right_song=${song_length#*":"}
# calculate song length in seconds
length_in_sec=$((60*$left_song+$right_song))

if [[ "$1" == "--pos" ]]; then
  echo $current_final_position
elif [[ "$1" == "--len" ]]; then
  echo $length_in_sec
elif [[ "$1" == "--cur" ]]; then
  echo $current_position
fi
