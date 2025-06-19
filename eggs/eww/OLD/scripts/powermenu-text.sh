#!/bin/bash
#
text=$(shuf -n 1 ~/.config/eww/resources/powermenu/text.txt)
eww update power-text="$text"
