#!/bin/sh

dir="/home/$USER/Pictures/Wallpapers/"
autostart="/home/$USER/.local/bin/autostart.sh"
theme_select="~/.config/rofi/themes/WallpaperSwitcher/Wallpaper.rasi"
theme_permanent="~/.config/rofi/themes/WallpaperSwitcher/Confirm.rasi"
current_wm=$(wmctrl -m | awk '/Name/ {print $2}')

cd $dir
wallpaper="none"

select_wall(){
wallpaper=$(ls $dir | for a in *.*; do echo -en "$a\0icon\x1f$a\n" ; done | PREVIEW=true rofi -dmenu -show-icons -config $theme_select -me-select-entry "MousePrimary" -me-accept-entry "!MouseDPrimary" -p "")

if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
  killall feh && exit
else
  if [[ $current_wm == "Hyprland" ]]; then
    set_wall_hyprland
  else
    set_wall
  fi
fi
}

set_wall(){
permanent=$(echo -e "Yes\nNo" | rofi -dmenu -config $theme_permanent -me-select-entry "MousePrimary" -me-accept-entry "!MousePrimary" -p "Set the wallpaper permanently?")
   if [[ $permanent == "No" ]]; then
      feh --bg-fill $dir$wallpaper
    else
      feh --bg-fill $dir$wallpaper && sed -i "/feh --bg-fill/c\feh --bg-fill $dir$wallpaper" $autostart
    fi
}

set_wall_hyprland(){
permanent=$(echo -e "Yes\nNo" | rofi -dmenu -config $theme_permanent -me-select-entry "MousePrimary" -me-accept-entry "!MousePrimary" -p "Set the wallpaper permanently?")
   if [[ $permanent == "No" ]]; then
      hyprctl hyprpaper preload $dir$wallpaper && hyprctl hyprpaper wallpaper , $dir$wallpaper
			hyprctl hyprpaper unload all
    else
      hyprctl hyprpaper preload $dir$wallpaper && hyprctl hyprpaper wallpaper , $dir$wallpaper &&
      sed -i "s|preload = .*|preload = $dir$wallpaper|g" ~/.config/hypr/hyprpaper.conf
      sed -i "s|wallpaper = .*|wallpaper = , $dir$wallpaper|g" ~/.config/hypr/hyprpaper.conf
			hyprctl hyprpaper unload all
      eww update currWallpaper="$wallpaper"
    fi
}

select_wall
