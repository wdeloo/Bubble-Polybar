#!/bin/bash
catFzxcv=$(cat ~/.config/polybar/bubble-polybar/scripts/xreof/x)
if [ "$catFzxcv" != "1" ]; then
	echo "1" > ~/.config/polybar/bubble-polybar/scripts/xreof/x
else
	echo "0" > ~/.config/polybar/bubble-polybar/scripts/xreof/x
fi
