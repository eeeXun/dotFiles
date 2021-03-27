#!/bin/sh

clear
printf "Change Files\n---\n$fx\n---\n"
read -p "Mod bits: " ans
chmod ${ans} $fx
lf -remote 'send reload'
