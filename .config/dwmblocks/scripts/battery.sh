#!/bin/sh

mode=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "${mode}" == "Charging" ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 10 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 20 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 30 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 40 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 50 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 60 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 70 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 80 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 90 ];then
    echo " ${capacity}%"
else
    echo " ${capacity}%"
fi
