#!/bin/sh

mode=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "${mode}" == "Charging" ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 5 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 15 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 25 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 35 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 45 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 55 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 65 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 75 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 85 ];then
    echo " ${capacity}%"
elif [ $((capacity)) -le 95 ];then
    echo " ${capacity}%"
else
    echo " ${capacity}%"
fi
