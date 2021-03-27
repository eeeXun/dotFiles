#!/bin/sh

clear
printf "Create in: $(pwd)\n---\n"
printf "1) mkfiles\t2) mkdirs\t3) mkdirs & mkfiles\n\n"
read -p "Enter a number: " ans

case ${ans} in
    1)
        read -p "Files Name: " files
        touch ${files}
        ;;
    2)
        read -p "Directories Name: " directories
        mkdir -p ${directories}
        ;;
    3)
        read -p "Directories Name: " directories
        mkdir -p ${directories}
        read -p "Files Name: " files
        touch ${files}
        ;;
    *) exit 0 ;;
esac
