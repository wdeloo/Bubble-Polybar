#!/bin/bash
catFzxcv=$(cat ~/.config/polybar/bubble-polybar/scripts/xreof/x)
if [ "$catFzxcv" != "1" ]; then
	systemctl poweroff
else
	systemctl reboot
fi
