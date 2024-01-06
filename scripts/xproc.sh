#!/bin/zsh
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)

catFl=$(cat ~/.config/polybar/bubble-polybar/scripts/xproc/x)
cpuUsaged=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.2f\%\n", usage}' 2>/dev/null)
memUsaged=$(z="$(y="$(echo -n 0;x="$(for s in $(cat /proc/meminfo | grep -e MemTotal -e MemFree | awk '{print $2}'|tac);do echo -n ${s}\/;done | sed s%/%%2)";echo $x | bc -l)";echo "1-${y}" | bc | xargs echo 0 | sed s/\ //g)"; echo $((${z}*100)) | awk '{printf "%.2f\%", $1}' 2>/dev/null)

if [ "$catFl" != "1" ]; then
	echo "%{F${primary}} %{F-}${cpuUsaged}"
else
	echo "%{F${primary}}󰿵 %{F-}${memUsaged}"
fi

