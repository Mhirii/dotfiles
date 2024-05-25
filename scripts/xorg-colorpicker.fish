#!/bin/fish

set color (gpick -p -s -o)
copyq add $color
echo $color | xsel -i -b 
notify-send $color "has been saved"
