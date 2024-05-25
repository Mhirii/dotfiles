set m ( hyprctl monitors -j )
if test ( echo $m| jq ".[].name"|wc -l) = 2
    if test (expr (echo $m | jq ".[1].x") == -1920) = 0
        hyprctl keyword monitor HDMI-A-2,1920x1080@60,-1920x0,1
        hyprctl notify -1 3000 "rgb(7aa2f7)" "External Monitor Detected"
    else
        echo correct
    end
end
