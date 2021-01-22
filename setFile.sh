#!/bin/bash

echo "Setting dwm?"
while read reply;do
    if [ ${reply:0:1} == "n" ];then
        break
    elif [ ${reply:0:1} == "y" ];then
        mv ./systemSetting/dwm.desktop /usr/share/xsessions/
        mv ./.config/dwm/ ./.config/dwmblocks/ ${HOME}/.config/
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
        mv ./.config/bspwm/ ./.config/sxhkd/ ./.config/polybar ${HOME}/.config/
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
        mv ./.config/nvim/ ./.config/mypy/ ${HOME}/.config/
        mv ./.config/gtk-3.0/settings.ini ${HOME}/.config/gtk-3.0/
        mv ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
        break
    else
        echo "Setting bspwm?"
    fi
done
