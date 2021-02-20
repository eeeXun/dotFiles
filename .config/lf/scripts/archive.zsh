#!/bin/zsh

clear
printf "Archive Files\n---\n"
echo "$fx"
printf "---\n1) 7z\t2) tar\t3) tar.gz\t4) zip\n\n"
read "ans?Enter a number or method: "

files_count=$(echo $fx | wc -w)
if [ $((files_count)) = 1 ];then
    case "${ans}" in
        1|7z) default_file="$fx.7z";;
        2|tar) default_file="$fx.tar";;
        3|tar.gz) default_file="$fx.tar.gz";;
        4|zip) default_file="$fx.zip";;
        *) exit 0;;
    esac
else
    case "${ans}" in
        1|7z) default_file="$(pwd)/$(basename $(pwd)).7z";;
        2|tar) default_file="$(pwd)/$(basename $(pwd)).tar";;
        3|tar.gz) default_file="$(pwd)/$(basename $(pwd)).tar.gz";;
        4|zip) default_file="$(pwd)/$(basename $(pwd)).zip";;
        *) exit 0;;
    esac
fi

files=""
for file in ${=fx};do
    files="${files} $(basename ${file})"
done

file_name="${default_file}"
vared -p "Output name: " file_name
case "${ans}" in
    1|7z) apack -F "7z" "${file_name}" ${=files};;
    2|tar) apack -F "tar" "${file_name}" ${=files};;
    3|tar.gz) apack -F "tar.gz" "${file_name}" ${=files};;
    4|zip) apack -F "zip" "${file_name}" ${=files};;
esac
