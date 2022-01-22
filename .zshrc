# title
function precmd () {
    print -Pn "\e]0;%~\a"
}
function preexec () {
    print -Pn "\e]0;$2\a"
}
# theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# ZSH config
source $HOME/.config/zsh/ZSHconfig.sh
