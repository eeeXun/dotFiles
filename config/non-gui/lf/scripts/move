#!/bin/zsh

clear
printf "Move Files\n---\n$fx\n---\n"
ans="$(pwd)/"
vared -p "To: " ans

IFS=$'\n'
for file in ${=fx}; do
    mv --backup=numbered "$file" "$ans"
done
