#!/bin/sh

case "$(file --mime-type "$f" -bL)" in
    text/*|application/json|inode/x-empty) $EDITOR "$f";;
    *) nohup xdg-open "$f" &> /dev/null &;;
esac
