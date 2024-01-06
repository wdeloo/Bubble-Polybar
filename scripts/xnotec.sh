#!/bin/bash
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/xnote/x)
if [ "$catBin" != "1" ]; then
	echo "1" > ~/.config/polybar/bubble-polybar/scripts/xnote/x
else
	echo "0" > ~/.config/polybar/bubble-polybar/scripts/xnote/x
fi
