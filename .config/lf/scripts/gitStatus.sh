#!/bin/bash

clear
if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
    git status
else
    echo "Not in git repo"
fi
read -p "Press any key to continue ... " -n 1 -r
