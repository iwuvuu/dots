#!/usr/bin/env bash

dir="/home/$USER/Pictures/Wallpapers/"

all_files=$(ls $dir -1 | wc -l)

echo "$all_files"

random_number=$(($RANDOM % ($all_files ) + 1))

echo "$random_number"

wallpaper=$(ls $dir | sed -n "$random_number p")

echo "$wallpaper"

hyprctl hyprpaper preload $dir$wallpaper && hyprctl hyprpaper wallpaper , $dir$wallpaper &&
sed -i "s|preload = .*|preload = $dir$wallpaper|g" ~/.config/hypr/hyprpaper.conf
sed -i "s|wallpaper = .*|wallpaper = , $dir$wallpaper|g" ~/.config/hypr/hyprpaper.conf

