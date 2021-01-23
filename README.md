# vim
- git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
- sudo pacman -S nodejs (for coc.nvim)
- sudo pacman -S yarn (for coc.nvim)
- sudo pacman -S ripgrep (for CocSearch)
- pip3 install jedi (for coc-python)
- pip3 install mypy (for coc-python)
- sudo pacman -S ccls
> Vundle with markdown-preview
>> call mkdp#util#install()

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# neovim

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- sudo pacman -S xclip

# bspwm
- sudo pacman -S bspwm
- sudo pacman -S sxhkd
- sudo pacman -S polybar

# dwm
- sudo mv ./systemSetting/dwm.desktop /usr/share/xsessions/

## Source of dwm
- [GoDzM4TT3O](https://github.com/GoDzM4TT3O/dwm)

# Packages
- sudo pacman -S dmenu
- sudo pacman -S feh
- sudo pacman -S flameshot
- sudo pacman -S compton
    - `touch ~/.config/compton.conf`

# zsh
- git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
- chsh -s /bin/zsh

# font
- sudo pacman -S ttf-font-awesome
- sudo pacman -S noto-fonts-emoji
- Chinese font
    - git clone https://aur.archlinux.org/noto-fonts-tc.git
    - cd noto-fonts-tc
    - makepkg -si

# touchpad
- sudo mv 01-touchpad.conf /etc/X11/xorg.conf.d/01-touchpad.conf
