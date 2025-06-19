#!/bin/bash

WINDOWS=$(hyprctl clients | grep "Window" | wc -l)

#echo "$WINDOWS"
eww update PM-windows=$WINDOWS
