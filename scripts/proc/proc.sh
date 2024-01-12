#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/proc/bin)
if [ "$1" = "toggle" ]; then
if [ "$catBin" = "0" ]; then
    echo "1" > ~/.config/polybar/bubble-polybar/scripts/proc/bin
else
    echo "0" > ~/.config/polybar/bubble-polybar/scripts/proc/bin
fi
else
cpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.2f\%\n", usage}' 2>/dev/null)
memUsage=$(z="$(y="$(echo -n 0;x="$(for s in $(cat /proc/meminfo | grep -e MemTotal -e MemFree | awk '{print $2}'|tac);do echo -n ${s}\/;done | sed s%/%%2)";echo $x | bc -l)";echo "1-${y}" | bc | xargs echo 0 | sed s/\ //g)"; echo "${z}*100" | bc | awk '{printf "%.2f\%", $1}' 2>/dev/null)
if [ "$catBin" = "0" ]; then
	echo "%{F${primary}} %{F-}${cpuUsage}"
else
	echo "%{F${primary}}󰿵 %{F-}${memUsage}"
fi
fi
