#!/bin/bash

case "$1" in
	--num)
		sed -n 1p /sys/class/leds/input*::numlock/brightness
	;;
	--caps)
		sed -n 1p /sys/class/leds/input*::capslock/brightness
	;;
esac

