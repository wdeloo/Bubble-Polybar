#!/bin/bash
catFlkjhh=$(cat ~/.config/polybar/bubble-polybar/scripts/xshow/x)

function killprocessesPolybar {
  uidPolyProc=$(pgrep -a polybar | grep -v show | awk '{print $1}')
  for i in $uidPolyProc; do
    kill $i
  done
}

if [ "$catFlkjhh" != "1" ]; then
    echo "1" > ~/.config/polybar/bubble-polybar/scripts/xshow/x
    killprocessesPolybar
else
    echo "0" > ~/.config/polybar/bubble-polybar/scripts/xshow/x
    ~/.config/polybar/bubble-polybar/scripts/launch.sh
fi
