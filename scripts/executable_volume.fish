#!/bin/fish


function toggle_mute
    if test (pamixer --get-mute) = true
        pamixer -u
    else if test (pamixer --get-mute) = false
        pamixer -m
    end
end

function toggle_mic
    if test (pamixer --default-source --get-mute) = true
        pamixer -u --default-source u
    else if test (pamixer --get-mute) = false
        pamixer --default-source -m
    end
end

function inc_volume
    pamixer -i 5
end

function dec_volume
    pamixer -d 5
end

function current_volume
    pamixer --get-volume
end

if test $argv = mute
    toggle_mute
else if test $argv = mic
    toggle_mic
else if test $argv = inc
    inc_volume
else if test $argv = dec
    dec_volume
else if test $argv = vol
    current_volume
else
    echo "mute:   toggle mute"
    echo "mic:    toggle mic"
    echo "inc:    increase volume"
    echo "dec:    decrease volume"
    echo "vol:    curent volume"
end
