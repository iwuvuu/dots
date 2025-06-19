#!/bin/bash
#
blue_status=$(bluetoothctl show | grep Powered: | awk '{print $2}')
if [ $blue_status == "yes" ]; then
  blue_class="connected"
else
  blue_class="disconnected"
fi
echo $blue_class
