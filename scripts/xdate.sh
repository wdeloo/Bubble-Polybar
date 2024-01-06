#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)

catErtcv=$(cat ~/.config/polybar/bubble-polybar/scripts/xdate/x)
catTyhbl=$(cat ~/.config/polybar/bubble-polybar/scripts/xdate/xc)
dateTimexcv=$(date | awk '{print $4}')
if [ "$catErtcv" == "0" ]; then
    echo "%{F${primary}} %{F-}${dateTimexcv}"
fi
if [ "$catErtcv" == "1" ]; then
    echo "%{F${primary}} %{F-}${catTyhbl}"
fi
