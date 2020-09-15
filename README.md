# Config file with vim,bspwm,zsh and polybar

## vim
- git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
- sudo pacman -S nodejs (for coc.nvim)
- sudo pacman -S yarn (for coc.nvim)
- sudo pacman -S ripgrep (for CocSearch)
- sudo pip3 install -U jedi (for coc-python)
- sudo pacman -S ccls
> Vundle with markdown-preview
>> call mkdp#util#install()

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## neovim

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- sudo pacman -S xclip

## bspwm
- sudo pacman -S dmenu
- sudo pacman -S feh
- sudo pacman -S flameshot

## zsh
- git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
- chsh -s /bin/zsh

## polybar
- sudo pacman -S ttf-font-awesome
- sudo pacman -S noto-fonts-emoji
