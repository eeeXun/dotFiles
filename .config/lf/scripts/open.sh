#!/bin/bash

case "$(file --mime-type "$f" -bL)" in
    text/*|application/json|inode/x-empty) $EDITOR "$f";;
    *) xdg-open "$f" &;;
esac
