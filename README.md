# vim

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# neovim

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- sudo pacman -S xclip

# coc.nvim
- sudo pacman -S nodejs # (for coc.nvim)
- sudo pacman -S yarn # (for coc.nvim)
- sudo pacman -S ripgrep # (for CocSearch)
- sudo pacman -S ccls
- pip3 install jedi-language-server
- pip3 install mypy # (for python diagnostics)
- sudo pacman -S gopls

# bspwm
- sudo pacman -S bspwm
- sudo pacman -S sxhkd
- sudo pacman -S polybar

# dwm
- sudo mv ./systemSetting/dwm.desktop /usr/share/xsessions/

# Packages
- sudo pacman -S dmenu
- sudo pacman -S feh
- sudo pacman -S flameshot
- sudo pacman -S picom
    - `touch ~/.config/picom.conf`

# zsh
- paru -S zsh-theme-powerlevel10k zsh-autosuggestions autojump
- chsh -s /bin/zsh

# lf
- paru -S bat glow ueberzug atool odt2txt docx2txt jq libcdio ffmpegthumbnailer imagemagick

# font
- paru -S nerd-fonts-hack
- sudo pacman -S noto-fonts-emoji
- paru -S noto-fonts-tc

# touchpad
- sudo mv ./systemSetting/01-touchpad.conf /etc/X11/xorg.conf.d/01-touchpad.conf
