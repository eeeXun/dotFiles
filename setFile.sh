#!/bin/bash

user_home="/home/xun"

echo "Setting dwm?"
while read reply;do
    if [ ${reply:0:1} == "n" ];then
        break
    elif [ ${reply:0:1} == "y" ];then
        mv ./systemSetting/dwm.desktop /usr/share/xsessions/
        mv ./.config/dwm/ ./.config/dwmblocks/ ${user_home}/.config/
        break
    else
        echo "Setting dwm?"
    fi
done

echo "Setting bspwm?"
while read reply;do
    if [ ${reply:0:1} == "n" ];then
        break
    elif [ ${reply:0:1} == "y" ];then
        mv ./.config/bspwm/ ./.config/sxhkd/ ./.config/polybar ${user_home}/.config/
        break
    else
        echo "Setting bspwm?"
    fi
done

echo "Setting neovim and apparence?"
while read reply;do
    if [ ${reply:0:1} == "n" ];then
        break
    elif [ ${reply:0:1} == "y" ];then
        mv ./.config/nvim/ ./.config/mypy/ ${user_home}/.config/
        mv ./.config/gtk-3.0/settings.ini ${user_home}/.config/gtk-3.0/
        mv ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
        break
    else
        echo "Setting bspwm?"
    fi
done
