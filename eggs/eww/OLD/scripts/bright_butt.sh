#!/bin/bash

CurrBright=$(xrandr --verbose --current | grep ^'eDP-1' -A5 | tail -n1 | sed -n 's/^.*Brightness:\s*\(\S*\).*$/\1/p')


echo $CurrBright
