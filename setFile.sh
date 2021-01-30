#!/bin/bash

echo "Setting dwm?"
while read reply;do
    if [ ${reply:0:1} == "n" ];then
        break
    elif [ ${reply:0:1} == "y" ];then
        sudo cp ./systemSetting/dwm.desktop /usr/share/xsessions/
        cp -r ./.config/dwm/ ./.config/dwmblocks/ ${HOME}/.config/
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
        cp -r ./.config/bspwm/ ./.config/sxhkd/ ./.config/polybar ${HOME}/.config/
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
        cp -r ./.config/nvim/ ./.config/mypy/ ./.config/lf/ ${HOME}/.config/
        cp ./.config/gtk-3.0/settings.ini ${HOME}/.config/gtk-3.0/
        sudo cp ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
        break
    else
        echo "Setting bspwm?"
    fi
done
