export EDITOR="/usr/bin/nvim"
export PAGER="bat --plain --paging=always --theme=gruvbox-dark"
export PATH="$PATH:$HOME/.local/bin"
eval "$(dircolors $HOME/.config/dircolors)"

# LESS
export LESS="-MR"
ESC=$(printf "\\033")
export LESS_TERMCAP_mb="$ESC[6m"        # begin blinking
export LESS_TERMCAP_md="$ESC[01;34m"    # begin bold
export LESS_TERMCAP_us="$ESC[4;01;32m"  # begin underline
export LESS_TERMCAP_so="$ESC[43;30m"    # begin standout-mode
export LESS_TERMCAP_me="$ESC[m"         # end mode
export LESS_TERMCAP_ue="$ESC[m"         # end underline
export LESS_TERMCAP_se="$ESC[m"         # end standout-mode

# Fcitx
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export SDL_IM_MODULE="fctix"
export XMODIFIERS="@im=fcitx"

# Other
export QT_QPA_PLATFORMTHEME="qt5ct"
export _JAVA_AWT_WM_NONREPARENTING=1
