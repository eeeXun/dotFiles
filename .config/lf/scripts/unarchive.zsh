#!/bin/zsh

clear
for file in ${=fx};do
    als -l "${file}"
    printf "---\n${file}\n"
    read "ans?Process unarchive? [Y/n] "
    case "${ans}" in
        [Yy]*)
            undir="$(pwd)/"
            printf "---\nUnarchive in?\n"
            vared undir
            case "${file}" in
                *.zip) unzip "${file}" -d "${undir}";;
                *.tar) mkdir -p "${undir}";tar -xvf "${file}" -C "${undir}";;
                *.tar.gz) mkdir -p "${undir}";tar -xzvf "${file}" -C "${undir}";;
                *) echo "Unsupported format";;
            esac
            ;;
    esac
    echo ""
done
