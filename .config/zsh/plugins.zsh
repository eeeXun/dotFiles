# autojump
source "/etc/profile.d/autojump.zsh"

# history-substring-search
source "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# autosuggestions
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# hstr
setopt histignorespace          # skip cmds w/ leading space from history
export HSTR_CONFIG="hicolor"    # get more colors
hstr_no_tiocsti() {
    zle -I
    { HSTR_OUT="$( { </dev/tty hstr ${BUFFER}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    BUFFER="${HSTR_OUT}"
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N hstr_no_tiocsti
export HSTR_TIOCSTI=n
