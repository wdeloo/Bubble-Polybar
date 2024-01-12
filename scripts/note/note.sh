#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/note/bin)
if [ "$1" = "toggle" ]; then
	if [ "$catBin" = "0" ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/note/bin
	else
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/note/bin
	fi
elif [ "$1" = "copy" ]; then
	if [ "$catBin" = "0" ]; then
		echo -n $(cat ~/.config/polybar/bubble-polybar/scripts/note/1) | xclip -sel clip
	else
		echo -n $(cat ~/.config/polybar/bubble-polybar/scripts/note/2) | xclip -sel clip
	fi
elif [ "$1" = "clip" ]; then
	if [ "$catBin" = "0" ]; then
		echo "%{F${primary}}¹"
	else
		echo "%{F${primary}}²"
	fi
else
	if [ "$catBin" = "0" ]; then
		cat ~/.config/polybar/bubble-polybar/scripts/note/1
	else
		cat ~/.config/polybar/bubble-polybar/scripts/note/2
	fi
fi
