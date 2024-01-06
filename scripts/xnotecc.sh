#!/bin/bash
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/xnote/x)
if [ "$catBin" != "1" ]; then
	cat ~/.config/polybar/bubble-polybar/scripts/xnote/1 | tr -d '\n' | xclip -sel clip
else
	cat ~/.config/polybar/bubble-polybar/scripts/xnote/2 | tr -d '\n' | xclip -sel clip
fi
