#!/bin/sh

clear
if [ -d .git ]; then
    git log --color=always --graph --pretty=format:'%C(yellow)(%cs) %Cred%h%Creset - %s %C(blue)<%an> %Cgreen%d' | less -r
else
    echo "Not in git repo"
    read -p "Press any key to continue ... " -n 1 -r
fi
