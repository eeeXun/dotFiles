#!/bin/sh

clear
printf "Change Files\n---\n$fx\n---\n"
read -p "Mod bits: " ans

IFS="
"
for file in $fx; do
    chmod "${ans}" "${file}"
done
lf -remote 'send reload'
