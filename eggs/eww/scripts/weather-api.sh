#!/bin/bash

CITY="Litovel"
UNIT="metric"
API_KEY="a0945f838df4e8228c668ecf18a054d1"

API=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$API_KEY&units=$UNIT")

case "$1" in
	--temp)	
		echo "$API" | jq -r '.main.temp'
	;;
	--wind)	
		echo "$API" | jq -r '.wind.speed'
	;;
	--desc)	
		echo "$API" | jq -r '.weather[0].description'
	;;
	--icon)	
		echo "$API" | jq -r '.weather[0].icon'
	;;
	--city)	
		echo "$API" | jq -r '.name'
	;;
	--hum)	
		echo "$API" | jq -r '.main.humidity'
	;;
esac
