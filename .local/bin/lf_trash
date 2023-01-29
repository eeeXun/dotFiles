#!/bin/sh

trash="/tmp/trash"

if [ ! -d "$trash" ]; then
    mkdir -p /tmp/trash
fi

IFS="
"
for file in $fx; do
    mv --backup=numbered "$file" "$trash"
done
