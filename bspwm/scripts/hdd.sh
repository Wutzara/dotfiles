#!/bin/sh
alias spacer='printf "   "'

source $(dirname $0)/config.sh

HDDROOT=`df -h | grep /dev/mapper/fedora-root |awk '{print $5}'| sed 's/%//'`
HDDHOME=`df -h | grep /dev/mapper/fedora-home |awk '{print $5}'| sed 's/%//'`

echo -n "^i($HOME/.config/bspwm/icons/root.xbm)" $(echo $HDDROOT | gdbar -h 1 -w 50 -fg $BAR_FG -bg $BAR_BG)
echo -n " ^i($HOME/.config/bspwm/icons/home.xbm)" $(echo $HDDHOME | gdbar -h 1 -w 50 -fg $BAR_FG -bg $BAR_BG)

printf "\n" # flush output
unalias spacer
