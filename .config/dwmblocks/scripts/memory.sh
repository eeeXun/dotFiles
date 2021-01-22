#!/bin/bash

usage=$(free -m | awk '/^Mem/ { print $3+$5 }')

if [ $((usage)) -le 1024 ];then
    echo -n "0" && echo -n $(bc <<< "scale=2; ${usage}/1024") && echo "G"
else
    echo -n $(bc <<< "scale=2; ${usage}/1024") && echo "G"
fi
