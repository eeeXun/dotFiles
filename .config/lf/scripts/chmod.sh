#!/bin/bash

clear
printf "Change Files\n---\n"
for file in $fx;do
    echo ${file}
done
echo "---"
read -p "Mod bits: " ans
chmod ${ans} $fx
lf -remote 'send reload'
