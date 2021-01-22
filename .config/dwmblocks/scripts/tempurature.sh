#!/bin/bash

scan_dir=$(ls /sys/devices/platform/coretemp.0/hwmon/)
tempurature=$(cat /sys/devices/platform/coretemp.0/hwmon/${scan_dir}/temp5_input)

echo $((tempurature/1000))°C
