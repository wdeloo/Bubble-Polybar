#!/bin/bash
catFlkjhh=$(cat ~/.config/polybar/bubble-polybar/scripts/xshow/x)
if [ "$catFlkjhh" == "0" ]; then
    echo "%{T1}﯎"
fi
if [ "$catFlkjhh" == "1" ]; then
    echo "%{T2}﯏ "
fi
