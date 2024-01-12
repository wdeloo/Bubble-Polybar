#!/bin/bash
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/reof/bin)
if [ "$1" = "toggle" ]; then
	if [ "$catBin" = "0" ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/reof/bin
	else
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/reof/bin
	fi
elif [ "$1" = "do" ]; then
	if [ "$catBin" = "0" ]; then
		sudo /usr/bin/systemctl poweroff
	else
		sudo /usr/bin/systemctl reboot
	fi
else
	if [ "$catBin" = "0" ]; then
		echo "襤"
	else
		echo ""
	fi
fi
