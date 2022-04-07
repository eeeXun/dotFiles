#!/bin/sh

config_dir="$HOME/.config"
bin_dir="$HOME/.local/bin"

while read -p "Install dwm? [Y/n] " reply; do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            git clone https://github.com/eeeXun/dwm.git ${config_dir}/dwm/
            git clone https://github.com/eeeXun/dwmblocks.git ${config_dir}/dwmblocks/
            sudo make -C ${config_dir}/dwm/ install clean
            sudo make -C ${config_dir}/dwmblocks/ install clean
            sudo cp ./systemSetting/dwm.desktop /usr/share/xsessions/
            break;;
    esac
done

while read -p "Set up bspwm? [Y/n] " reply; do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/bspwm/ ./.config/sxhkd/ ./.config/polybar/ ${config_dir}
            break;;
    esac
done

while read -p "Set up i3? [Y/n] " reply; do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/i3/ ./.config/i3status/ ${config_dir}
            break;;
    esac
done

while read -p "Set up touchpad? [Y/n] " reply; do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            sudo cp ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/
            break;;
    esac
done

while read -p "Defalut session? (1) dwm (2) bspwm (3) mate (4) i3 (n) no : " reply; do
    case ${reply} in
        1|dwm) session="dwm";;
        2|bspwm) session="bspwm";;
        3|mate) session="mate";;
        4|i3) session="i3";;
        n|no) break;;
        *) continue;;
    esac
    sudo sed -i "s/^#\?user-session=.*/user-session=${session}/" /etc/lightdm/lightdm.conf
    break
done

while read -p "Terminal emulator? (1) st (2) termite (3) alacritty (n) no : " reply; do
    case ${reply} in
        1|st)
            git clone https://github.com/eeeXun/st.git ${config_dir}/st/
            sudo make -C ${config_dir}/st/ install clean
            sudo cp ./systemSetting/st.desktop /usr/share/applications/
            break;;
        2|termite)
            cp -r ./.config/termite/ ${config_dir}
            break;;
        3|alacritty)
            cp -r ./.config/alacritty/ ${config_dir}
            break;;
        n|no) break;;
    esac
done

while read -p "Set up script? [Y/n] " reply; do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            sudo cp ./systemSetting/lf_run /usr/local/bin
            mkdir -p ${bin_dir}
            cp ./.local/bin/* ${bin_dir}
            break;;
    esac
done

while read -p "Set up other config? [Y/n] " reply; do
    case ${reply} in
        [Nn]*) break;;
        [Yy]*)
            cp -r ./.config/nvim/ ./.config/mypy/ ./.config/lf/ \
                ./.config/gtk-3.0/ ./.config/zsh/ ./.config/tmux/ \
                ./.config/zathura/ ./.config/nsxiv/ ./.config/dunst/ \
                ./.config/color.sh ./.config/libinput-gestures.conf ${config_dir}
            cp ./.zshrc ./.profile ./.tmux.conf ./.Xresources ./.dircolors ${HOME}/
            touch ${config_dir}/picom.conf
            git config --global user.email "sdes96303@gmail.com"
            git config --global user.name "eeeXun"
            break;;
    esac
done
