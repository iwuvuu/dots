#!/usr/bin/env bash

APP_EXECUTABLE=$1
APP_NAME=$2
if [[ "$APP_EXECUTABLE" == nvim* ]]; then
	kitty -e nvim
else
if [[ "$APP_EXECUTABLE" == *%* || "$APP_EXECUTABLE" == */usr/* ]]; then
	astal-apps -l $2
else
	kitty -e $1
fi
fi

