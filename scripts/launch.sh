#!/bin/bash
bars=$(cat ~/.config/polybar/bubble-polybar/config.ini | grep "\[bar/" | sed 's/\[bar\///g' | tr -d "\]" | grep -v "show")

for bar in $bars; do
	polybar $bar --config=~/.config/polybar/bubble-polybar/config.ini &
done
