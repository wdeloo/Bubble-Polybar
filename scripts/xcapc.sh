#!/bin/bash
catFmnx=$(cat ~/.config/polybar/bubble-polybar/scripts/xcap/x)
if [ "$catFmnx" != "1" ]; then
	echo "1" > ~/.config/polybar/bubble-polybar/scripts/xcap/x
else
	echo "0" > ~/.config/polybar/bubble-polybar/scripts/xcap/x
fi
