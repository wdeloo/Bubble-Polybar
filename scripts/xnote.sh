#!/bin/sh
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/xnote/x)
if [ "$catBin" != "1" ]; then
	cat ~/.config/polybar/bubble-polybar/scripts/xnote/1
else
	cat ~/.config/polybar/bubble-polybar/scripts/xnote/2
fi
