#!/bin/bash

### RAM
#total_mem_h=$(free -h | grep Mem: | awk '{print $2}')
#used_mem_h=$(free -h | grep Mem: | awk '{print $3}')
#free_mem_h=$(free -h | grep Mem: | awk '{print $7}')
#total_mem=$(free | grep Mem: | awk '{print $2}')
#used_mem=$(free | grep Mem: | awk '{print $3}')
#free_mem=$(free | grep Mem: | awk '{print $7}')

#used_mem_per=$(awk "BEGIN {print ($used_mem * 100) / $total_mem}")
#free ram in percentq:
#used_mem_fin=$(printf "%0.0f\n" $used_mem_per)
#echo "used memory: $used_mem_fin%"

### DISK
total_disk=$(df | grep nvme0n1p2 | awk '{print $4}')
used_disk=$(df | grep nvme0n1p2  | awk '{print $3}')
percent_disk=$(df | grep nvme0n1p2  | awk '{print $5}')

#echo "used disk: $percent_disk"

### UPTIME
uptime=$(uptime -p | tr -d 'utesupo')
#(uptime -p | awk '{print $2 "hrs, " $4 "min"}')

#echo $uptime


if [[ "$1" == "--uptime" ]]; then
  echo $uptime
elif [[ "$1" == "--total" ]]; then
  echo $total_disk
elif [[ "$1" == "--used" ]]; then
  echo $used_disk
elif [[ "$1" == "--percent" ]]; then
  echo $percent_disk
fi
