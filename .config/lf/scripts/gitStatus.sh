#!/bin/sh

clear
if [ -d .git ]; then
    git status
else
    echo "Not in git repo"
fi
read -p "Press any key to continue ... " -n 1 -r
