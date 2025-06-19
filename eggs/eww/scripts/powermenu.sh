#/bin/sh

case "$1" in
	--PM1) 
	eww close bar && 
	eww open powerMenu --screen 0 &&
	eww update whichbar='bar' &&
	bash ~/.config/eww/scripts/windows_number.sh
	;;
	--PM2) 
	eww close bar2 && 
	eww open powerMenu --screen 1 && 
	eww update whichbar='bar2' && 
	bash ~/.config/eww/scripts/windows_number.sh
	;;
esac



