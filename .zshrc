# TERM
if [[ $TERM = xterm-* ]]; then
    export TERM="xterm-256color"
fi
# title
function precmd () { print -Pn "\e]0;%~\a" }
function preexec () { print -Pn "\e]0;$1\a" }
# theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# ZSH setting
source $HOME/.config/zsh/ZSHconfig.sh
