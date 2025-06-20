#!/bin/bash
#

while true; do
	blue_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
	echo $blue_status
	sleep 1
done
