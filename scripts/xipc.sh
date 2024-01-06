#!/bin/bash

interfaces=$(ifconfig | awk '{print $1}' | grep ":" | tr -d ":" | grep -wv "lo" | grep -v "veth"; echo "internet")
interfacesQuantity=$(echo $interfaces | wc -w)
actual=$(cat ~/.config/polybar/bubble-polybar/scripts/xip/x)

if [ $actual -ge $interfacesQuantity ]; then
	echo "1" > ~/.config/polybar/bubble-polybar/scripts/xip/x
else
	echo $(($actual+1)) > ~/.config/polybar/bubble-polybar/scripts/xip/x
fi
