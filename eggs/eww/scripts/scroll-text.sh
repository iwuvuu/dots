#!/usr/bin/env bash
while true; do
	for ((i = 0; i < 101; i++)); do
		echo "$i"
		sleep 0.1
	done
	sleep 3.0
	for ((i=100; i>-1; i--)); do
		echo "$i"
		sleep 0.1
	done
	sleep 3.0
done
