#!/bin/bash

clear
printf "Archive Files\n---\n"
for file in $fx;do
    echo ${file}
done
echo "---"
printf "1) zip\t2) tar\t3) tar.gz\n\n"
read -p "Enter a number or method: " ans

files_count=$(echo $fx | wc -w)
if [ ${files_count} == 1 ];then
    case "${ans}" in
        1|zip) default_file="$fx.zip" ;;
        2|tar) default_file="$fx.tar" ;;
        3|tar.gz) default_file="$fx.tar.gz" ;;
        *) exit 0 ;;
    esac
else
    case "${ans}" in
        1|zip) default_file="$(pwd)/$(basename $(pwd)).zip" ;;
        2|tar) default_file="$(pwd)/$(basename $(pwd)).tar" ;;
        3|tar.gz) default_file="$(pwd)/$(basename $(pwd)).tar.gz" ;;
        *) exit 0 ;;
    esac
fi

files=""
for file in $fx;do
    files="${files} $(basename ${file})"
done

read -p "Output name: " -ei "${default_file}" file_name
case "${ans}" in
    1|zip) zip -r "${file_name}" ${files} ;;
    2|tar) tar -cvf "${file_name}" ${files} ;;
    3|tar.gz) tar -zcvf "${file_name}" ${files} ;;
esac
