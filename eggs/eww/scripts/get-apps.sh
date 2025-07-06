#!/usr/bin/env bash

#ALL_APPS=$(astal-apps -j | jq | grep '"name"' | awk '{ s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s }' | tr -d \",)
#ALL_APPS=$(astal-apps -j | sed 's/},/},\n/g')
ALL_APPS=$(astal-apps -j)

echo "$ALL_APPS"

