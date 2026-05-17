#!/bin/sh

if [ -d "$f" ]; then
    nohup nsxiv -t "$f" > /dev/null 2>&1 &
else
    nohup nsxiv -t "$(pwd)" > /dev/null 2>&1 &
fi
