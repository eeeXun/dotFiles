# theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# key binding
bindkey -e
bindkey '^W' vi-backward-kill-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word

# alias
alias ls='ls --color=auto'
alias history='history -$HISTSIZE'
alias vim='nvim'
alias lf='lfrun'

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -U compinit && compinit
zmodload -i zsh/complist

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
