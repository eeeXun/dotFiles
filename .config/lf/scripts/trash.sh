#!/bin/sh

if ![ -d /tmp/trash ];then
    mkdir -p /tmp/trash
fi
mv $fx /tmp/trash
