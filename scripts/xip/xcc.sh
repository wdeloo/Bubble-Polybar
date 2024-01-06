#!/bin/bash

for i in $(seq 1 60); do
	ipPub=$(curl -s http://ifconfig.co || echo "err")
	echo $ipPub > ~/.config/polybar/bubble-polybar/scripts/xip/xc
	sleep 1
done
