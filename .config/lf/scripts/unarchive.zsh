#!/bin/zsh

clear
IFS=$'\n'
for file in ${=fx};do
    case "${file}" in
        *.7z|*.tar|*.tar.gz|*.zip)
            als -l "${file}"
            printf "---\n${file}\n"
            read "ans?Process unarchive? [Y/n] "
            case "${ans}" in
                [Yy]*)
                    unpackDir="$(pwd)/"
                    printf "---\nUnarchive in?\n"
                    vared unpackDir
                    mkdir -p ${unpackDir};aunpack "${file}" -X ${unpackDir};;
            esac
            ;;
        *)
            echo "Unsupported format of ${file}"
            read -sk1 "?Press any key to continue ..."
            echo ""
            ;;
    esac
    echo ""
done
