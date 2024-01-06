#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)

catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/xnote/x)
if [ "$catBin" != "1" ]; then
	echo "%{F${primary}}¹"
else
	echo "%{F${primary}}²"
fi
