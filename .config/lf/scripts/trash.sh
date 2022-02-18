#!/bin/sh

if ! [ -d /tmp/trash ]; then
    mkdir -p /tmp/trash
fi

IFS="
"
for file in $fx; do
    mv --backup=numbered "${file}" /tmp/trash/
done
