#!/usr/bin/env bash

CURR_MON=$(hyprctl monitors -j | jq '.[] | {"id:\(.id)" : "focused: \(.focused)"}' | grep "true" | awk '{print $1}' | tr -d \"id:)

eww open popup-appLauncher --screen $CURR_MON --toggle
