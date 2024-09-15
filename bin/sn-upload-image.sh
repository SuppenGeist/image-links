#!/bin/sh

repo_folder=$(dirname "$0")
repo_folder=$(dirname $repo_folder)

echo $repo_folder

file_ending=""
if [[ "$1" == *.png ]]; then
    file_ending=.png
elif [[ "$1" == *.jpg ]]; then
    file_ending=.jpg
fi

if [[ $file_ending == "" ]]; then
    echo "Unhandled file extension"
    exit
fi

target_file=$(uuidgen)$file_ending
cp_target=$repo_folder/$target_file

cp "$1" "$cp_target"
git -C $repo_folder add $cp_target
git -C $repo_folder commit -m"Add image"
git -C $repo_folder push origin master

echo ""
echo "Link:"
echo "https://raw.githubusercontent.com/SuppenGeist/image-links/master/$target_file"
