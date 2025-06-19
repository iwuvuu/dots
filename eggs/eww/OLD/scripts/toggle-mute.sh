volume_status=$(amixer | grep 'Front Left: Playback' | awk '{print $6}')
cur_volume=$(amixer | grep 'Left: Playback' | awk '{print $5}' | tr -d '[%]')

if [ $volume_status == "[off]" ]; then
  volume_class="volume-off"
  volume_icon=""
else
  if [ $cur_volume -gt -1 ]; then
    volume_class="volume-on"
    volume_icon="" 
    if [ $cur_volume -gt 35 ]; then
      volume_class="volume-on"
      volume_icon=""
      if [ $cur_volume -gt 69 ]; then
        volume_class="volume-on"
        volume_icon=""
      fi
    fi 
  fi
fi

echo "(button :class '$volume_class' :valign 'start' :vexpand false :onclick 'amixer set Master toggle' '$volume_icon')"
