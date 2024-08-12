#!/usr/bin/env bash

get_bluetooth_status() {
  bluetooth_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
  if [ "$bluetooth_status" == "yes" ]; then
    echo "󰂯"
    exit 0
  else
    echo "󰂲"
    exit 1
  fi
}
get_bluetooth_name() {
  name=$(bluetoothctl info | grep "Name" | sed 's/.*Name: //')
  echo "$name"
}
get_bluetooth_icon() {
  icon=$(bluetoothctl info | grep "Icon" | sed 's/.*Icon: //')
  # this will return input-keyboard or audio-headphones or audio-speakers
  # if input-keyboard then return 
  # if audio-headphones then return 
  # if audio-speakers then return 󰓃
  if [ "$icon" == "input-keyboard" ]; then
    echo " "
  elif [ "$icon" == "audio-headphones" ]; then
    echo " "
  elif [ "$icon" == "audio-speakers" ]; then
    echo "󰓃 "
  else
    echo ""
  fi
}
get_bluetooth_connected() {
  connected=$(bluetoothctl info | grep "Connected" | awk '{print $2}')
  if [ "$connected" == "yes" ]; then
    get_bluetooth_icon
    exit 0
  else
    echo ""
    exit 1
  fi
}

if [ "$1" == "status" ]; then
  get_bluetooth_status
elif [ "$1" == "name" ]; then
  get_bluetooth_name
elif [ "$1" == "icon" ]; then
  get_bluetooth_icon
elif [ "$1" == "waybar" ]; then
  if [ "$2" == "minimal" ]; then
    echo "$(get_bluetooth_icon)$(get_bluetooth_status)"
    exit 0
  fi
  if [ "$2" == "full" ]; then
    echo "$(get_bluetooth_name) $(get_bluetooth_status) $(get_bluetooth_icon)"
    exit 0
  fi
elif [ "$1" == "connected" ]; then
  get_bluetooth_connected
else
  echo "Usage: $0 {status|name|icon|connected}"
  exit 1
fi
