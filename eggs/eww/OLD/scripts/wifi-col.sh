#!/bin/bash
#
wifi_status=$(nmcli | grep wlan0: | awk '{print $2}')
if [ $wifi_status == "connected" ]; then
  wifi_class="connected"
else
  wifi_class="disconnected"
fi
echo $wifi_class
