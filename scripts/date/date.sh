#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/date/bin)
if [ "$1" = "toggle" ]; then
	if [ "$catBin" = "0" ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/date/bin
	else
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/date/bin
	fi
else
	Date=$(date +'%d-%m-%Y')
	Time=$(date +'%H:%M:%S')
	if [ "$catBin" = "0" ]; then
		echo "%{F${primary}} %{F-}${Time}"
	else
		echo "%{F${primary}} %{F-}${Date}"
	fi
fi
