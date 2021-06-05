# TERM
if [[ $TERM = xterm-* ]]; then
    export TERM="xterm-256color"
fi
# title
function precmd () {
    print -Pn "\e]0;%~\a"
    if [ -n "$TMUX" ]; then
        tmux set-window-option -q window-status-current-format "#[bg=colour214,fg=colour237,nobold,noitalics,nounderscore]#[bg=colour214,fg=colour239] #I #[bg=colour214,fg=colour239,bold] $(basename ${PWD/#$HOME/\~}) #[bg=colour237,fg=colour214,nobold,noitalics,nounderscore]"
        tmux set-window-option -q window-status-format "#[bg=colour239,fg=colour237,noitalics]#[bg=colour239,fg=colour223] #I #[bg=colour239,fg=colour223] $(basename ${PWD/#$HOME/\~}) #[bg=colour237,fg=colour239,noitalics]"
    fi
}
function preexec () {
    print -Pn "\e]0;$2\a"
    if [ -n "$TMUX" ]; then
        tmux set-window-option -q window-status-current-format "#[bg=colour214,fg=colour237,nobold,noitalics,nounderscore]#[bg=colour214,fg=colour239] #I #[bg=colour214,fg=colour239,bold] #W#{?window_zoomed_flag,*Z,} #[bg=colour237,fg=colour214,nobold,noitalics,nounderscore]"
        tmux set-window-option -q window-status-format "#[bg=colour239,fg=colour237,noitalics]#[bg=colour239,fg=colour223] #I #[bg=colour239,fg=colour223] #W #[bg=colour237,fg=colour239,noitalics]"
    fi
}
# theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# ZSH config
source $HOME/.config/zsh/ZSHconfig.sh
