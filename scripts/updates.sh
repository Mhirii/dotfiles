#!/usr/bin/env bash

threshhold_green=0
threshhold_yellow=25
threshhold_red=100

if ! updates=$(paru -Qu --quiet | wc -l); then
  updates=0
fi

css_class="green"

if [ "$updates" -gt $threshhold_yellow ]; then
  css_class="yellow"
fi

if [ "$updates" -gt $threshhold_red ]; then
  css_class="red"
fi

if [ "$updates" -gt $threshhold_green ]; then
  printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
else
  printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "green"}'
fi
