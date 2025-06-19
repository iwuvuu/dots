#!/bin/bash
MONITOR=$(hyprctl activeworkspace -j | grep '"monitorID"' | awk '{print $2}' | tr -d ,)
eww open osd --screen=$MONITOR
sleep 2
eww close osd
