#!/bin/bash

while read -p "Setting dwm? [Y/n] " reply;do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            sudo cp ./systemSetting/dwm.desktop /usr/share/xsessions/
            cp -r ./.config/dwm/ ./.config/dwmblocks/ ${HOME}/.config/
            break;;
    esac
done

while read -p "Setting bspwm? [Y/n] " reply;do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/bspwm/ ./.config/sxhkd/ ./.config/polybar ${HOME}/.config/
            break;;
    esac
done

while read -p "Setting neovim and apparence? [Y/n] " reply;do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/termite/ ./.config/nvim/ ./.config/mypy/ ./.config/lf/ ${HOME}/.config/
            cp ./.config/gtk-3.0/settings.ini ${HOME}/.config/gtk-3.0/
            cp ./.zshrc ./.profile ${HOME}/
            sudo cp ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
            sudo cp ./systemSetting/lfrun /usr/bin/
            break;;
    esac
done
