#!/usr/bin/env bash

LIST_ACTIVE=$(eww active-windows | grep "popup-*" | awk '{print $2}')

if [[ "$LIST_ACTIVE" == *popup-powermenu* ]]; then
	eww update pwrState="false"
fi
#echo "closed $LIST_ACTIVE"
eww close $LIST_ACTIVE
