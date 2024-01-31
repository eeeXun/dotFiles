#!/bin/sh

killall -q dunst dwmblocks xss-lock udiskie polkit-mate-authentication-agent-1
dunst &
dwmblocks &
fcitx5 -r &
nm-applet &
udiskie --smart-tray &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
feh --no-fehbg --bg-scale $HOME/.local/share/background.jpg &
picom &
blueman-applet &
libinput-gestures-setup restart &
xset s 300 30 &
xss-lock -n dim_run -- lock_run &
