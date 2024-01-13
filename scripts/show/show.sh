#!/bin/bash
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/show/bin)
function killprocessesPolybar {
	uidPolybar=$(pgrep -a polybar | grep -v show | awk '{print $1}')
	for i in $uidPolybar; do
		kill $i
	done
}
if [ "$1" = "showHide" ]; then
	if [ "$catBin" = "0" ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/show/bin
		killprocessesPolybar
	else
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/show/bin
		bars=$(cat ~/.config/polybar/bubble-polybar/config.ini | grep "\[bar/" | sed 's/\[bar\///g' | tr -d "\]" | grep -v "show")
		for bar in $bars; do
			polybar $bar --config=~/.config/polybar/bubble-polybar/config.ini &
		done
	fi
else
	if [ "$catBin" = "0" ]; then
		echo "󰛐"
	else
		echo "󰛑"
	fi
fi
