#!/bin/sh

# formula = rx2-rx1
wifi_interface="wlo1"
eth_interface="enp0s20f0u1"

function getSpeed(){
    rx1=$(cat /sys/class/net/${1}/statistics/rx_bytes)
    sleep 1
    rx2=$(cat /sys/class/net/${1}/statistics/rx_bytes)
    speed=$(numfmt --to=iec $((rx2-rx1)))
    if [ $(echo ${speed} | grep "K" || echo ${speed} | grep "M") ];then
        printf "%-2s %10s" "${2}" "${speed}/s"
    else
        printf "%-2s %10s" "${2}" "${speed}B/s"
    fi
}

if [ -e /sys/class/net/${eth_interface} ];then
    getSpeed ${eth_interface} 
else
    wifi_status=$(cat /sys/class/net/${wifi_interface}/operstate)
    if [ ${wifi_status} == "up" ];then
        getSpeed ${wifi_interface} 
    else
        echo ""
    fi
fi
