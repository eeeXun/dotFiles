#!/bin/bash

# formula = rx2-rx1
wifi_device="wlo1"
eth_device="enp0s20f0u1"

function getSpeed(){
    rx1=$(cat /sys/class/net/${1}/statistics/rx_bytes)
    sleep 1
    rx2=$(cat /sys/class/net/${1}/statistics/rx_bytes)
    speed=$(numfmt --to=iec $((rx2-rx1)))
    if [ $(echo ${speed} | grep "K" || echo ${speed} | grep "M") ];then
        printf "%-2s %9s" "${2}" "${speed}/s"
    else
        printf "%-2s %9s" "${2}" "${speed}B/s"
    fi
}

if [ $(ls /sys/class/net/ | grep ${eth_device}) ];then
    getSpeed ${eth_device} 
else
    wifi_status=$(ip a | grep ${wifi_device} | head -1 | awk '{print $9}')
    if [ ${wifi_status} == "UP" ];then
        getSpeed ${wifi_device} 
    else
        echo ""
    fi
fi
