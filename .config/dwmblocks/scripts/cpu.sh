#!/bin/bash

# formula = 100 - 100*(idle2-idle1)/(sum2-sum1)
# Time 1
info1=$(cat /proc/stat | head -1)
idle1=$(echo ${info1} | awk '{print $5 }')
sum1=$(echo ${info1} | awk '{print $2+$3+$4+$5+$6+$7+$8}')

sleep 1

# Time 2
info2=$(cat /proc/stat | head -1)
idle2=$(echo ${info2} | awk '{print $5 }')
sum2=$(echo ${info2} | awk '{print $2+$3+$4+$5+$6+$7+$8}')

printf "%3s" "$(( 100 - 100*(${idle2}-${idle1})/(${sum2}-${sum1}) ))%"
