#!/bin/bash
catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/cap/bin)
catBinVid=$(cat ~/.config/polybar/bubble-polybar/scripts/cap/binVid)
if [ "$1" = "make" ]; then
	capId="1"
	nmCap="cap(${capId}).jpg"
	nmCapVid="cap(${capId}).mp4"
	mkdir -p ~/pictures/screenshots 2>/dev/null
	capVid(){
		if [ "$catBinVid" = "0" ];then
			while [ "$(/bin/ls ~/pictures/screenshots/${nmCapVid} 2>/dev/null | wc -l)" = "1" ];do
				capId=$((${capId}+1))
				nmCapVid="cap(${capId}).mp4"
			done
			echo "1" > ~/.config/polybar/bubble-polybar/scripts/cap/binVid
			ffmpeg -y -s 1920x1080 -r 30 -f x11grab -i :0.0 ~/pictures/screenshots/${nmCapVid}
		else
			echo "0" > ~/.config/polybar/bubble-polybar/scripts/cap/binVid
			pkill ffmpeg
		fi
	}
	capPic(){
		while [ "$(/bin/ls ~/pictures/screenshots/${nmCap} 2>/dev/null | wc -l)" = "1" ];do
			capId=$((${capId}+1))
		 	nmCap="cap(${capId}).jpg"
		done
		import -window root ~/pictures/screenshots/${nmCap}
	}
	if [ "$catBin" = "0" ]; then
		capPic
	else
		capVid
	fi
elif [ "$1" = "toggle" ]; then
	if [ "$catBin" = "0" ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/cap/bin
	else
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/cap/bin
	fi
else
	if [ "$catBin" = "0" ]; then
		echo ""
	else
		if [ "$catBinVid" = "0" ]; then
			echo ""
		else
			echo ""
		fi
	fi
fi
