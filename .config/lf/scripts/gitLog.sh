#!/bin/bash

clear
if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
    git log --color=always --graph --pretty=format:'%C(yellow)(%cs) %C(red)%h%Creset - %s %C(brightblue)<%an> %C(brightgreen)%d' | less -MR
else
    echo "Not in git repo"
    read -p "Press any key to continue ... " -n 1 -r
fi
