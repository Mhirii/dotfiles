#!/bin/bash

# this will most likely be ../../some/path/to/file
file=$1

echo ""
# turn file into an absolute path
absolute_path=$(cd "$(dirname "$file")" && pwd)/$(basename "$file")
# echo "editing $absolute_path"

replace_word() {
  # echo "replacing $1 with $2 in $file"
  # sed should write to the file
  sed -i "s/$1/$2/g" "$absolute_path"
}

replace_word "#a6e3a1" "#90dc89"
replace_word "#94e2d5" "#41d2ba"
replace_word "#89dceb" "#2ec1dc"
replace_word "#74c7ec" "#32b1ec"
replace_word "#89b4fa" "#59a8f8"
replace_word "#b4befe" "#9193f7"
replace_word "#cba6f7" "#a879e2"
replace_word "#f2cdcd" "#e8a6a6"
replace_word "#f5c2e7" "#ee96d6"
replace_word "#f5e0dc" "#edbbb1"
replace_word "#f38ba8" "#ef6b91"
replace_word "#fab387" "#f18b74"
replace_word "#f9e2af" "#f6d484"
