#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)

bspcFzxcv=$(bspc query -D -d --names)
bspcVhgda=$(bspc query -N -d 7 | wc -l)
if [ "$bspcFzxcv" != "7" ]; then
	if [ "$bspcVhgda" == "0" ]; then
    echo "%{F-}󱓼"
	else
		echo "%{F-}󱓻"
	fi
else
	if [ "$bspcVhgda" == "0" ]; then
    echo "%{F${primary}}󱓼"
	else
		echo "%{F${primary}}󱓻"
	fi
fi
