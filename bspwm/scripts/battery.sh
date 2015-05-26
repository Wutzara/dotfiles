#!/bin/sh
alias spacer='printf "   "'

source $(dirname $0)/config.sh

BATT=`cat /sys/class/power_supply/BAT0/capacity`

printf "^i($HOME/.config/bspwm/icons/battery"
[ $BATT -lt 11  ] && P=0
[ $BATT -lt 51 ] && P=5
[ $BATT -gt 50 ] && P=10
printf "%d_ios.xbm) " $P
   
echo -n $(echo $BATT | gdbar -h 1 -w 50 -fg $BAR_FG -bg $BAR_BG)

printf "\n" # flush output
unalias spacer
