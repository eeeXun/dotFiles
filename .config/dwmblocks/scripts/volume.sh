#!/bin/bash

volume=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')
mode=$(amixer get Master | tail -n1 | sed -r 's/.*\[.*\].*\[(.*)\]/\1/')

if [ ${mode} == "off" ];then
    echo " ${volume}%"
elif [ $((volume)) -le 33 ];then
    echo " ${volume}%"
elif [ $((volume)) -le 66 ];then
    echo " ${volume}%"
else
    echo " ${volume}%"
fi
