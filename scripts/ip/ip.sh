#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)
interfaces=$(ifconfig | awk '{print $1}' | grep ":" | tr -d ":" | grep -wv "lo" | grep -v "veth"; echo "internet")
interfacesQuantity=$(echo -n "$interfaces" | wc -w)
bin=$(cat ~/.config/polybar/bubble-polybar/scripts/ip/bin)
interfazActual=$(echo "$interfaces" | head -n "$bin" | tail -n 1)
if [ "$1" = "toggle" ]; then
	if [ $bin -ge $interfacesQuantity ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/ip/bin
	else
		echo $((${bin}+1)) > ~/.config/polybar/bubble-polybar/scripts/ip/bin
	fi
elif [ "$1" = "getPub" ]; then
	for i in $(seq 1 60); do
		ip=$(curl -s http://ifconfig.co || echo "err")
		echo $ip > ~/.config/polybar/bubble-polybar/scripts/ip/pubIp
		sleep 1
	done
else
	if [ "$interfazActual" != "internet" ]; then
		ip=$(ifconfig "$interfazActual" | grep -w "inet" | awk '{print $2}')
		echo "%{F${primary}}直 %{F-}${ip}"
	else
		ip=$(cat ~/.config/polybar/bubble-polybar/scripts/ip/pubIp)
		if [ "$ip" = "err" ]; then
			icono="󰪎"
		else
			icono="󰖟"
		fi
		echo "%{F${primary}}${icono} %{F-}${ip}"
	fi
fi
if [ "$1" = "copy" ]; then
	echo -n $ip | xclip -sel clip
fi
