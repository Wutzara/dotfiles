#!/bin/bash
source $(dirname $0)/config.sh

echo -n "^ca(1, amixer sset Master toggle)^ca(4, amixer sset Master playback 3%+)^ca(5, amixer sset Master playback 3%-)^fg(#ff2d55)"
mute=`amixer get Master | grep "Front Left:" | awk '{print $6}'`
if [ $mute == "[on]" ]
then
    vol=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[]'`
    echo -n "^i($HOME/.config/bspwm/icons/volume1_ios.xbm)" $(echo $vol | gdbar -h 1 -w 50 -fg $BAR_FG -bg $BAR_BG)
else
    echo -n "^i($HOME/.config/bspwm/icons/volume0_ios.xbm)" $(echo $vol | gdbar -h 1 -w 50 -fg $BAR_FG -bg $BAR_BG)
fi

echo -n "^fg()^ca()^ca()^ca()"
