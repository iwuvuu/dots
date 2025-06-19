#!/bin/bash
caps_lock_status=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')
if [ $caps_lock_status == "on" ]; then
  caps_class="caps-on"
else
  caps_class="caps-off"
fi
echo "(box :class \"$caps_class\" (button :onclick \"xdotool key Caps_Lock\" \"󰯫\"))"
