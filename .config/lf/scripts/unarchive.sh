#!/bin/bash

clear
for file in $fx;do
    als -l "${file}"
    read -p "Process Unarchive? [Y/n] " ans
    case "${ans}" in
        [Yy]*)
            case "${file}" in
                *.tar) tar -xvf "${file}" ;;
                *.tar.gz) tar -xzvf "${file}" ;;
                *.zip) unzip "${file}" ;;
                *) echo "Unsupported format" ;;
            esac
            ;;
    esac
    echo ""
done
