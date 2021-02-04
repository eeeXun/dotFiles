#!/bin/bash

clear
echo "Directory Name: "
read -ei "$(pwd)/" ans
mkdir -p ${ans}
