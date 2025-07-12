#/bin/sh

case "$1" in
	--0) 
	eww open popup-powermenu --screen 0 
	;;
	--1) 
	eww open popup-powermenu --screen 1
	;;
	--Sleep)
		eww close popup-powermenu
		eww update pwrState=false && eww update pwrToggle=false
		hyprctl notify 3 5000 'rgb(282828)' 'fontsize:13 sleep'
	;;
	--Reboot)
		eww close popup-powermenu
		eww update pwrState=false && eww update pwrToggle=false
		reboot
	;;
	--Lock)
		eww close popup-powermenu
		eww update pwrState=false && eww update pwrToggle=false
		hyprctl notify 3 5000 'rgb(282828)' 'fontsize:13 Lock'
	;;
--LogOut)
		eww close popup-powermenu
		eww update pwrState=false && eww update pwrToggle=false
		hyprctl dispatch exit
	;;
--Shutdown)
		eww close popup-powermenu
		eww update pwrState=false && eww update pwrToggle=false
		shutdown now
	;;
esac



