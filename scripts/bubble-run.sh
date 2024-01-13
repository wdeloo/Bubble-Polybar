#!/bin/bash
bGround=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 1p)
bGroundOld=$(cat ~/.config/polybar/bubble-polybar/config.ini | grep "background =" | grep -v colors | awk '{print $3}')
sed -i "s/background = ${bGroundOld}/background = ${bGround}/g" ~/.config/polybar/bubble-polybar/config.ini
fGround=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 2p)
fGroundOld=$(cat ~/.config/polybar/bubble-polybar/config.ini | grep "foreground =" | grep -v colors | awk '{print $3}')
sed -i "s/foreground = ${fGroundOld}/foreground = ${fGround}/g" ~/.config/polybar/bubble-polybar/config.ini
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)
primaryOld=$(cat ~/.config/polybar/bubble-polybar/config.ini | grep "primary =" | grep -v colors | awk '{print $3}')
sed -i "s/primary = ${primaryOld}/primary = ${primary}/g" ~/.config/polybar/bubble-polybar/config.ini
pkill polybar 0>/dev/null 1>/dev/null 2>/dev/null
polybar show --config=~/.config/polybar/bubble-polybar/config.ini 0>/dev/null 1>/dev/null 2>/dev/null & 
echo "0" > ~/.config/polybar/bubble-polybar/scripts/show/bin
echo "0" > ~/.config/polybar/bubble-polybar/scripts/date/bin
echo "0" > ~/.config/polybar/bubble-polybar/scripts/proc/bin
echo "1" > ~/.config/polybar/bubble-polybar/scripts/ip/bin
echo "0" > ~/.config/polybar/bubble-polybar/scripts/note/bin
echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/binName
echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/binPlay
echo "0" > ~/.config/polybar/bubble-polybar/scripts/cap/bin
echo "0" > ~/.config/polybar/bubble-polybar/scripts/cap/binVid
echo "0" > ~/.config/polybar/bubble-polybar/scripts/reof/bin
bars=$(cat ~/.config/polybar/bubble-polybar/config.ini | grep "\[bar/" | sed 's/\[bar\///g' | tr -d "\]" | grep -v "show")
for bar in $bars; do
	polybar $bar --config=~/.config/polybar/bubble-polybar/config.ini 0>/dev/null 1>/dev/null 2>/dev/null &
done
