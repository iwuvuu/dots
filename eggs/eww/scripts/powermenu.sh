#/bin/sh

case "$1" in
	--0) 
	eww open powermenu --screen 0
	;;
	--1) 
	eww open powermenu --screen 1
	;;
	--Sleep)
		eww close powermenu
		eww update pwrState=false && eww update pwrToggle=false
		hyprctl notify 3 5000 'rgb(282828)' 'fontsize:13 sleep'
	;;
	--Reboot)
		eww close powermenu
		eww update pwrState=false && eww update pwrToggle=false
		reboot
	;;
	--Lock)
		eww close powermenu
		eww update pwrState=false && eww update pwrToggle=false
		hyprctl notify 3 5000 'rgb(282828)' 'fontsize:13 Lock'
	;;
--LogOut)
		eww close powermenu
		eww update pwrState=false && eww update pwrToggle=false

		hyprctl notify 3 5000 'rgb(282828)' 'fontsize:13 Logout'
	;;
--Shutdown)
		eww close powermenu
		eww update pwrState=false && eww update pwrToggle=false
		shutdown now
	;;
esac



