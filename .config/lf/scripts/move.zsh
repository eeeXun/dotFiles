#!/bin/zsh

clear
printf "Move Files\n---\n$fx\n---\n"
ans="$(pwd)/"
vared -p "To: " ans
mv $fx ${ans}
