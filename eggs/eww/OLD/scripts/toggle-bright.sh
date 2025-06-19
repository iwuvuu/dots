#!/bin/bash

CurrBright=$(xrandr --verbose --current | grep ^'eDP-1' -A5 | tail -n1 | sed -n 's/^.*Brightness:\s*\(\S*\).*$/\1/p')

CurrBright="${CurrBright##* }"  # Get brightness level with decimal place

Left=${CurrBright%%"."*}        # Extract left of decimal point
Right=${CurrBright#*"."}        # Extract right of decimal point

MathBright="0"
[[ "$Left" != 0 && "$STEP" -lt 10 ]] && STEP=10     # > 1.0, only .1 works
[[ "$Left" != 0 ]] && MathBright="$Left"00          # 1.0 becomes "100"
[[ "${#Right}" -eq 1 ]] && Right="$Right"0          # 0.5 becomes "50"
MathBright=$(( MathBright + Right ))

if [ $MathBright -lt 20 ]; then
  bright_class="bright_low"
  bright_level=1.0
else
  bright_class="bright_high"
  bright_level=0.19
fi

echo "(button :class '$bright_class' :valign 'start' :vexpand false :onclick 'xrandr --output eDP-1 --brightness $bright_level' '󰖨')"

