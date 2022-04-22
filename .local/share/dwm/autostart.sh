#!/bin/sh

killall -q dwmblocks xss-lock
dwmblocks &
fcitx5 -r &
nm-applet &
feh --no-fehbg --bg-scale $HOME/Pictures/background.jpg &
picom &
blueman-applet &
libinput-gestures-setup restart &
xset s 300 30 &
xss-lock -n dim_run -- lock_run &
