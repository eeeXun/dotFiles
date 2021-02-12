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
            cp -r ./.config/termite/ ./.config/nvim/ ./.config/mypy/ ./.config/lf/ ./.config/gtk-3.0/ ${HOME}/.config/
            cp ./.zshrc ./.profile ${HOME}/
            sudo cp ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
            sudo cp ./systemSetting/lfrun /usr/bin/
            git config --global user.email "sdes96303@gmail.com"
            git config --global user.name "eeeXun"
            break;;
    esac
done
