#!/bin/bash
catFmnx=$(cat ~/.config/polybar/bubble-polybar/scripts/xcap/x)
catFghjkx=$(cat ~/.config/polybar/bubble-polybar/scripts/xcap/xc)
capId="1" 
nmcap="cap(${capId}).jpg"
nmcapv="cap(${capId}).mp4"
capVid123(){
  if [ "$catFghjkx" != "1" ];then
    while [ "$(/bin/ls ~/pictures/screenshots/${nmcapv} 2>/dev/null | wc -l)" = "1" ];do
      capId=$((${capId}+1))
      nmcapv="cap(${capId}).mp4"
    done
    echo "1" > ~/.config/polybar/bubble-polybar/scripts/xcap/xc
    ffmpeg -y -s 1920x1080 -r 30 -f x11grab -i :0.0 ~/pictures/screenshots/${nmcapv}
  else
    echo "0" > ~/.config/polybar/bubble-polybar/scripts/xcap/xc
    pkill ffmpeg
  fi
}
capPic123(){
  while [ "$(/bin/ls ~/pictures/screenshots/${nmcap} 2>/dev/null | wc -l)" = "1" ];do
    capId=$((${capId}+1))
    nmcap="cap(${capId}).jpg"
  done
  import -window root ~/pictures/screenshots/${nmcap}
}

if [ "$catFmnx" != "1" ]; then
  capPic123
else
  capVid123
fi
