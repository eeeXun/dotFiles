#!/bin/sh

tempurature=$(cat /sys/class/thermal/thermal_zone0/temp)

echo $((tempurature/1000))°C
