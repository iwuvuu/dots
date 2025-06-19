#!/bin/sh

case "$1" in
  --amount)
    PACMAN_NUMBER=$(checkupdates | wc -l)
    AUR_NUMBER=$(aur-check-updates --raw | wc -l)
    UPDATE_NUM=$((PACMAN_NUMBER + AUR_NUMBER))
    eww update updatesNumber="$UPDATE_NUM"
    #echo $UPDATE_NUM
    #echo "amount"
  ;;
  --list)
    PACMAN_LIST=$(checkupdates)
    AUR_LIST=$(aur-check-updates --raw)
    echo -e "Pacman updates:\n$PACMAN_LIST\nAUR updates:\n$AUR_LIST"
    echo "list"
  ;;
esac

