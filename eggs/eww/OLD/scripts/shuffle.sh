#!/bin/bash
#
shuffle_status=$(playerctl shuffle)
loop_status=$(playerctl loop)

if [ $shuffle_status == "On" ]; then
  shuffle_class="shuffle-on"
else
  shuffle_class="shuffle-off"
fi

if [ $loop_status == "None" ]; then
  loop_class="loop-none"
elif [ $loop_status == "Track" ]; then
  loop_class="loop-track"
else
  loop_class="loop-playlist"
fi

if [[ "$1" == "--shuffle" ]]; then
	echo $shuffle_class
elif [[ "$1" == "--loop" ]]; then
  echo $loop_class
fi

