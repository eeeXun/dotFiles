#!/bin/bash

clear
printf "Move Files\n---\n"
for file in $fx;do
    echo ${file}
done
echo "---"
read -p "To: " -ei "$(pwd)/" ans
mv $fs ${ans}
