#!/bin/bash
command=$(cat ~/.config/polybar/bubble-polybar/scripts/programs.txt | sed -n 1p)
if [ "$1" = "run" ]; then
	${command} &
else
	echo "󰇧"
fi
