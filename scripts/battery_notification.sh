#!/bin/bash

battery_percentage="$(acpi -b | rg -o '[0-9]+%' | sudo sed 's/%//')"
echo "$battery_percentage"

line_power_path=$(upower -e | grep line_power)
cable_plugged=$(upower -i "$line_power_path" | grep -A2 'line-power' | grep online | awk '{ print $2 }')

echo "$cable_plugged"

if [[ $cable_plugged == 'yes' ]]; then

	if [[ $battery_percentage -gt 90 ]]; then
		notify-send --urgency=critical -t 60000 "Battery is Charged" "Battery reached 90%, unplug the power cable!"
		return

	elif [[ $battery_percentage -gt 80 ]]; then
		notify-send --urgency=normal -t 20000 "Battery optimization" "Battery reached 80%, you can unplug the power"
		return
	fi

else

	if [[ $battery_percentage -lt 30 ]]; then
		notify-send --urgency=critical -t 60000 "Battery is Dying" "Battery is below 30%, plug in the power cable!"
		return

	elif [[ $battery_percentage -lt 40 ]]; then
		notify-send --urgency=normal -t 20000 "Battery optimization" "Battery is below 40%, plug in the power cable!"
		return
	fi

fi
