#!/bin/bash

tempurature=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon6/temp5_input)

echo $((tempurature/1000))°C
