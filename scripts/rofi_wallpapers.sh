#!/usr/bin/env bash

wallDir="$HOME/Pictures/wallpapers"
wallpapers=$(find "$wallDir" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print | sort)
echo "got $(echo "$wallpapers" | wc -l) wallpapers"

r_override="element{border-radius:2px;} listview{columns:3;spacing:4px;} element{padding:0px;orientation:horizontal;} element-icon{size:30px;border-radius:0px;} element-text{padding:20px;}"

echo "running rofi.."
chosen = echo $wallpapers | while read rfile
do
    echo -en "$rfile\x00icon\x1f${cacheDir}/${gtkTheme}/${rfile}\n"
done | rofi -dmenu -theme-str "${r_override}" -config "${RofiConf}" -select "${currentWall}")

# chosen_wallpaper=$(rofi -dmenu -show-icons -theme-str "$r_override" \
# 	-format d:p \
# 	-columns 3 \
# 	<<<$(for wallpaper in $wallpapers; do
# 		preview_path="/tmp/rofi_wallpaper_preview_$(basename "$wallpaper").png"
# 		convert -resize 150x100 "$wallpaper" "$preview_path"
# 		echo " $(basename "$wallpaper")\x00icon\x1f$preview_path"
# 	done))
#
# rm -f /tmp/rofi_wallpaper_preview_*

# echo "$wallpapers" | rofi -dmenu -show-icons -theme-str "${r_override}" -i -p "Wallpapers"
