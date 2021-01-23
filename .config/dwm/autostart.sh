#!/bin/bash

killall ibus-daemon &
ibus-daemon -d &
dwmblocks &
mate-power-manager &
nm-applet &
feh --bg-scale ~/Pictures/background3.jpg &
picom &
/usr/bin/mate-screensaver --no-daemon &
