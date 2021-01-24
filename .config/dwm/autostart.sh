#!/bin/bash

if [ $(( $(ps aux | grep ibus-daemon | wc -l) )) -gt 1 ];then
    killall ibus-daemon
fi
dwmblocks &
ibus-daemon -d &
mate-power-manager &
nm-applet &
feh --bg-scale ~/Pictures/background3.jpg &
picom &
/usr/bin/mate-screensaver --no-daemon &
