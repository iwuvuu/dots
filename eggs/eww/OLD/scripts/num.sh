#!/bin/bash
num_lock_status=$(xset -q | sed -n 's/^.*Num Lock:\s*\(\S*\).*$/\1/p')
if [ $num_lock_status == "on" ]; then
  num_class="num-on"
else
  num_class="num-off"
fi
echo "(box :class \"$num_class\" (button :onclick \"xdotool key Num_Lock\" \"󰎦\"))"
