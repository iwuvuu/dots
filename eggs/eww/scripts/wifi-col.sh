#!/bin/bash
#
while true; do
wifi_status=$(nmcli | grep "wlp4s0:" | awk '{print $2}')
wifi_on=$(nmcli radio wifi)
if [[ $wifi_status == "connected" && $wifi_on == "enabled" ]]; then
  wifi_class="connected"
elif [[ $wifi_status != "connected" && $wifi_on == "enabled" ]]; then
  wifi_class="off"
else
	wifi_class="dead"
fi
echo $wifi_class
sleep 1
done
