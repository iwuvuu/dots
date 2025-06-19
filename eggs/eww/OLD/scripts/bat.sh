#!/bin/bash
bat_percent=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed -n 's/^.*percentage:\s*\(\S*\).*$/\1/p')
bat_int=${bat_percent%"%"}
bat_state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed -n 's/^.*state:\s*\(\S*\).*$/\1/p')

if [ $bat_state == "discharging" ]; then
  state="Discharging"
elif [ $bat_state == "charging" ]; then
  state="Charging"
elif [ $bat_state == "fully-charged" ]; then
  state="Fully Charged"
fi

if (( $bat_int > 0 )); then
  icon="󰂎"
  bat_class="critical"
  if (( $bat_int > 10 )); then
    icon="󰁺"
    bat_class="critical"
    if (( $bat_int > 20 )); then
      icon="󰁻"
      bat_class="critical"
      if (( $bat_int > 30 )); then
        icon="󰁼"
        bat_class="critical"
        if (( $bat_int > 40 )); then
          icon="󰁽"
          bat_class="mid"
          if (( $bat_int > 50 )); then
            icon="󰁾"
            bat_class="mid"
            if (( $bat_int > 60 )); then
              icon="󰁿"
              bat_class="mid"
              if (( $bat_int > 70 )); then
                icon="󰂀"
                bat_class="mid"
                if (( $bat_int > 80 )); then
                  icon="󰂁"
                  bat_class="good"
                  if (( $bat_int > 90 )); then
                    icon="󰂂"
                    bat_class="good"
                    if (( $bat_int == 100 )); then
                      icon="󰁹"
                      bat_class="good"
                    fi
                  fi
                fi
              fi
            fi
          fi
        fi
      fi
    fi
  fi
fi
echo "(box :tooltip '$bat_percent - $state' :hexpand true :vexpand true :class \"$bat_class\" \"$icon\")"
#eww update bat-percent=$bat_percent

#echo $state
#echo $bat_int
#echo $icon
#echo $bat_class

