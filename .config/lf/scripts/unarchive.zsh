#!/bin/zsh

clear
for file in ${=fx};do
    als -l "${file}"
    printf "---\n${file}\n"
    read "ans?Process unarchive? [Y/n] "
    case "${ans}" in
        [Yy]*)
            unpackDir="$(pwd)/"
            printf "---\nUnarchive in?\n"
            vared unpackDir
            case "${file}" in
                *.7z|*.tar|*.tar.gz|*.zip)
                    mkdir -p ${unpackDir};aunpack ${file} -X ${unpackDir};;
                *) echo "Unsupported format";;
            esac
            ;;
    esac
    echo ""
done
