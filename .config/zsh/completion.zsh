autoload -U compinit && compinit -d "$HOME/.cache/zcompdump"
zmodload -i zsh/complist
zstyle ":completion:*" menu select
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
zstyle ":completion:*" special-dirs true
