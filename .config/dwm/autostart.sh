#!/bin/bash

killall -q dwmblocks ibus-daemon
dwmblocks &
ibus-daemon -d &
mate-power-manager &
nm-applet &
feh --bg-scale ~/Pictures/background3.jpg &
picom &
mate-screensaver --no-daemon &
