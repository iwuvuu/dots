#!/usr/bin/env bash


#SEARCH=$(astal-apps -j -s $TERM)

#echo $SEARCH

while true; do
	clear
	TERM=$(eww get searchTerm)
	if [[ "$TERM" == "" || "$TERM" == "[]" ]]; then
		eww update showSearch="false" && eww update showAll="true"
	else
		eww update showSearch="true" && eww update showAll="false"
		SEARCH=$(astal-apps -j -s $TERM)
		echo "$SEARCH"
	fi
	sleep 0.2
done

