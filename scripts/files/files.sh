#!/bin/bash
command=$(cat ~/.config/polybar/bubble-polybar/scripts/programs.txt | sed -n 3p)
if [ "$1" = "run" ]; then
	${command} &
else
	echo "󰉖"
fi
