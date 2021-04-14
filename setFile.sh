#!/bin/sh

config_dir="${HOME}/.config/"

while read -p "Setting dwm? [Y/n] " reply;do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            sudo cp ./systemSetting/dwm.desktop /usr/share/xsessions/
            cp -r ./.config/dwm/ ./.config/dwmblocks/ ${config_dir}
            sudo make -C ${config_dir}/dwm/ install clean
            sudo make -C ${config_dir}/dwmblocks/ install clean
            break;;
    esac
done

while read -p "Setting bspwm? [Y/n] " reply;do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/bspwm/ ./.config/sxhkd/ ./.config/polybar ${config_dir}
            break;;
    esac
done

while read -p "Defalut session? (1) dwm (2) bspwm (3) mate : " reply;do
    case ${reply} in
        1|dwm) session="dwm";;
        2|bspwm) session="bspwm";;
        3|mate) session="mate";;
        *) continue;;
    esac
    sudo sed -i "s/^user-session=.*/user-session=${session}/" /etc/lightdm/lightdm.conf
    break
done

while read -p "Setting neovim and apparence? [Y/n] " reply;do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/termite/ ./.config/nvim/ ./.config/mypy/ ./.config/lf/ \
                ./.config/gtk-3.0/ ./.config/zsh/ ${config_dir}
            cp ./.zshrc ./.profile ${HOME}/
            sudo cp ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
            sudo cp ./systemSetting/lfrun /usr/bin/
            git config --global user.email "sdes96303@gmail.com"
            git config --global user.name "eeeXun"
            break;;
    esac
done
