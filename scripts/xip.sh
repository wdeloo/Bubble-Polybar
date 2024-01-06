#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)

(ifconfig | awk '{print $1}' | grep ":" | tr -d ":" | grep -wv "lo" | grep -v "veth"; echo "internet") > ~/.config/polybar/bubble-polybar/scripts/xip/xccc

interfaces=$(ifconfig | awk '{print $1}' | grep ":" | tr -d ":" | grep -wv "lo" | grep -v "veth"; echo "internet")
interfacesQuantity=$(echo "$interfaces" | wc -w)
actual=$(cat ~/.config/polybar/bubble-polybar/scripts/xip/x)
interfazActual=$(head -n $actual ~/.config/polybar/bubble-polybar/scripts/xip/xccc | tail -n 1)

if [[ "$interfazActual" != "internet" ]]; then
	ipActualN=$(ifconfig $interfazActual | grep -w "inet" | awk '{print $2}')
	echo $ipActualN > ~/.config/polybar/bubble-polybar/scripts/xip/xcccc
	echo "%{F${primary}}直 %{F-}${ipActualN}"
fi
if [[ "$interfazActual" = "internet" ]]; then
ipActualI=$(cat ~/.config/polybar/bubble-polybar/scripts/xip/xc)
	if [[ "$ipActualI" = "err" ]]; then
		iconoActual="󰪎"
	else
		iconoActual="󰖟"
		echo $ipActualI > ~/.config/polybar/bubble-polybar/scripts/xip/xcccc
	fi
	echo "%{F${primary}}${iconoActual} %{F-}${ipActualI}"
fi
