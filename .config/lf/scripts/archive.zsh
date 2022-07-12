#!/bin/zsh

clear
printf "Archive Files\n---\n"
echo "$fx"
printf "---\n1) 7z\t2) tar\t3) tar.gz\t4) zip\n\n"
read "ans?Enter a number or method: "

files_count=$(echo $fx | wc -l)
if [ $files_count -eq 1 ]; then
    case "$ans" in
        1|7z) default_name="$fx.7z";;
        2|tar) default_name="$fx.tar";;
        3|tar.gz) default_name="$fx.tar.gz";;
        4|zip) default_name="$fx.zip";;
        *) exit 0;;
    esac
else
    case "$ans" in
        1|7z) default_name="$(pwd)/$(basename $(pwd)).7z";;
        2|tar) default_name="$(pwd)/$(basename $(pwd)).tar";;
        3|tar.gz) default_name="$(pwd)/$(basename $(pwd)).tar.gz";;
        4|zip) default_name="$(pwd)/$(basename $(pwd)).zip";;
        *) exit 0;;
    esac
fi

files=()
IFS=$'\n'
for file in ${=fx}; do
    files+=("$(basename $file)")
done

output_name="$default_name"
vared -p "Output name: " output_name
case "$ans" in
    1|7z) apack -F "7z" $output_name $files;;
    2|tar) apack -F "tar" $output_name $files;;
    3|tar.gz) apack -F "tar.gz" $output_name $files;;
    4|zip) apack -F "zip" $output_name $files;;
esac
