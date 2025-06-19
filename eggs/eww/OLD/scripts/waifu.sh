#!/bin/bash

wainfo=$(shuf -n 1 ~/.config/eww/resources/waifu/info.txt)

name=$(grep "name:" ~/.config/eww/resources/waifu/$wainfo.txt | sed 's/name: //g')
url=$(grep "url:" ~/.config/eww/resources/waifu/$wainfo.txt | sed 's/url: //g')
image="/home/iwuvu/.config/eww/resources/waifu/art/$wainfo.png"
bd=$(grep "bd:" ~/.config/eww/resources/waifu/$wainfo.txt | sed 's/bd: //g')
height=$(grep "height:" ~/.config/eww/resources/waifu/$wainfo.txt | sed 's/height: //g')
url_click="librewolf $url"


eww update waifu-art=$image
eww update waifu-name="$name"
eww update waifu-bd="BD: $bd"
eww update waifu-height="H: $height"
eww update waifu-url="$url_click"
#echo "\"$image\""
#echo $wainfo
#echo $name
#echo $url
#echo $image
#echo $bd
#echo $height
