#!/bin/bash

clear
if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
    git log --color=always --graph --pretty=format:'%C(yellow)(%cs) %Cred%h%Creset - %s %C(blue)<%an> %Cgreen%d' | less -MR
else
    echo "Not in git repo"
    read -p "Press any key to continue ... " -n 1 -r
fi
