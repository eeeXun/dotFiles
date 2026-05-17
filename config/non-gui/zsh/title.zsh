function precmd () {
    print -Pn "\e]0;%~\a"
}

function preexec () {
    print -Pn "\e]0;$2\a"
}
