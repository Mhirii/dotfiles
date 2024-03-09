set options Alacritty Kitty Rofi Github

set selected_option $(printf "%s\n" $options | rofi -dmenu -i -mesg "Choose" -config ~/.config/rofi/power.rasi)

switch $selected_option
    case Alacritty
        alacritty
    case Kitty
        kitty
    case rofi
        rofi -show drun
    case github
        firefox --new-tab https://github.com
end
