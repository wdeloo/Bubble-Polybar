#!/bin/bash
catFl=$(cat ~/.config/polybar/bubble-polybar/scripts/xproc/x)
if [ "$catFl" != "1" ]; then
	echo "1" > ~/.config/polybar/bubble-polybar/scripts/xproc/x
else
	echo "0" > ~/.config/polybar/bubble-polybar/scripts/xproc/x
fi
