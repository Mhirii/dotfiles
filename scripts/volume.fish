#!/bin/fish

function toggle_mute
    if test (pamixer --get-mute) = true
        if test (ps aux | rg bin/ags | wc -l) -gt 1
            ags -r 'audio.speaker.is_muted = false; indicator.speaker()'
        end
        pamixer -u
    else if test (pamixer --get-mute) = false
        if test (ps aux | rg bin/ags | wc -l) -gt 1
            ags -r 'audio.speaker.is_muted = true; indicator.speaker()'
        end
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

    if test (ps aux | rg bin/ags | wc -l) -gt 1
        ags -r 'audio.speaker.volume += 0.05; indicator.speaker()'
    else
        pamixer -i 5
    end
end

function dec_volume
    if test (ps aux | rg bin/ags | wc -l) -gt 1
        ags -r 'audio.speaker.volume -= 0.05; indicator.speaker()'
    else
        pamixer -d 5
    end
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
    echo "vol:    current volume"
    if test (ps aux | rg bin/ags | wc -l) -gt 1
        echo yes
    end
end
