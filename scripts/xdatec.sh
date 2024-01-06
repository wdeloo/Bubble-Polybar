#!/bin/bash
catFzxxv=$(cat ~/.config/polybar/bubble-polybar/scripts/xdate/x)
if [ "$catFzxxv" != "1" ]; then
	echo "1" > ~/.config/polybar/bubble-polybar/scripts/xdate/x
else
	echo "0" > ~/.config/polybar/bubble-polybar/scripts/xdate/x
fi
