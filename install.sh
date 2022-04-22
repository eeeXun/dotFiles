#!/bin/sh

config_dir="./.config"
local_dir="./.local"
sys_dir="./systemSetting"

while read -p "Install dwm? [Y/n] " reply; do
    case $reply in
        [Nn]*) break;;
        [Yy]*)
            git clone https://github.com/eeeXun/dwm.git $HOME/.config/dwm/
            git clone https://github.com/eeeXun/dwmblocks.git $HOME/.config/dwmblocks/
            sudo make -C $HOME/.config/dwm/ install clean
            sudo make -C $HOME/.config/dwmblocks/ install clean
            sudo cp ./systemSetting/dwm.desktop /usr/share/xsessions/
            mkdir -p $HOME/.local/share/
            cp -r $local_dir/share/dwm $HOME/.local/share/
            break;;
    esac
done

while read -p "Set up bspwm? [Y/n] " reply; do
    case $reply in
        [Nn]*) break;;
        [Yy]*)
            cp -r $config_dir/bspwm/ $config_dir/sxhkd/ $config_dir/polybar/ $HOME/.config/
            break;;
    esac
done

while read -p "Set up i3? [Y/n] " reply; do
    case $reply in
        [Nn]*) break;;
        [Yy]*)
            cp -r $config_dir/i3/ $config_dir/i3status/ $HOME/.config/
            break;;
    esac
done

while read -p "Set up touchpad? [Y/n] " reply; do
    case $reply in
        [Nn]*) break;;
        [Yy]*)
            sudo cp $sys_dir/01-touchpad.conf /etc/X11/xorg.conf.d/
            break;;
    esac
done

while read -p "Defalut session? (1) dwm (2) bspwm (3) mate (4) i3 (n) no : " reply; do
    case $reply in
        1|dwm) session="dwm";;
        2|bspwm) session="bspwm";;
        3|mate) session="mate";;
        4|i3) session="i3";;
        n|no) break;;
        *) continue;;
    esac
    sudo sed -i "s/^#\?user-session=.*/user-session=$session/" /etc/lightdm/lightdm.conf
    break
done

while read -p "Terminal emulator? (1) st (2) termite (3) alacritty (n) no : " reply; do
    case $reply in
        1|st)
            git clone https://github.com/eeeXun/st.git $HOME/.config/st/
            sudo make -C $HOME/.config/st/ install clean
            sudo cp $sys_dir/st.desktop /usr/share/applications/
            break;;
        2|termite)
            cp -r $config_dir/termite/ $HOME/.config/
            break;;
        3|alacritty)
            cp -r $config_dir/alacritty/ $HOME/.config
            break;;
        n|no) break;;
    esac
done

while read -p "Set up script? [Y/n] " reply; do
    case $reply in
        [Nn]*) break;;
        [Yy]*)
            sudo cp $sys_dir/lf_run /usr/local/bin
            mkdir -p $HOME/.local/
            cp -r $local_dir/bin/ $HOME/.local/
            break;;
    esac
done

while read -p "Set up other config? [Y/n] " reply; do
    case $reply in
        [Nn]*) break;;
        [Yy]*)
            cp -r $config_dir/nvim/ $config_dir/mypy/ $config_dir/lf/ \
                $config_dir/gtk-3.0/ $config_dir/zsh/ $config_dir/tmux/ \
                $config_dir/zathura/ $config_dir/nsxiv/ $config_dir/dunst/ \
                $config_dir/dircolors $config_dir/libinput-gestures.conf \
                $HOME/.config/
            cp ./.zshrc ./.profile ./.tmux.conf ./.Xresources $HOME/
            touch $HOME/.config/picom.conf
            git config --global user.email "sdes96303@gmail.com"
            git config --global user.name "eeeXun"
            break;;
    esac
done
