#!/bin/bash

clear
if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
    git log --graph --color=always --pretty=format:"%C(yellow)(%cs) %C(brightred)%h%Creset - %s %C(brightblue)<%an> %C(auto)%d" | less -MR
else
    echo "Not in git repo"
    read -p "Press any key to continue ... " -n 1 -r
fi
