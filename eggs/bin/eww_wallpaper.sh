#!/usr/bin/env zsh

#dir="/home/$USER/Pictures/Wallpapers/"
#ouput="["

#cd $dir
#wallpaper="none"
#wallpaper=$(ls $dir | for a in *.*; do echo -en "$a\0icon\x1f$a\n" ; done)
#wallpaper=$(for a in *.*; do echo "	{\n		\"wallpaper\": \"$a\"\n	}," ; done)
#wallpaper=$(ls $dir)

#echo "[ \"data\": $wallpaper { \"wallpaper\": \"nothing\", \"path\": \"nothing\" }]"
#echo "[\n$wallpaper	{\n		\"wallpaper\": \"nothing\"\n	}\n]"


wallpaper_dir="/home/$USER/Pictures/Wallpapers"
output="["

first=1
for file in "$wallpaper_dir"/*.{jpg,jpeg,png}; do
  filename=$(basename "$file")
  filepath=$(realpath "$file")

	if [ $first -eq 0 ]; then
    output+=","
  fi
  output+="{\"wallpaper\":\"$filename\",\"path\":\"$filepath\"}"
  first=0
done
output+="]"

echo "$output"




