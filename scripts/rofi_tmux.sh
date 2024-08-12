#!/usr/bin/env bash

sessions=$(tmux list-sessions | awk '{print $1}' | sed 's/://')
selection=$(echo -e "$sessions" | rofi -dmenu -i -p "Tmux")

echo "selection: $selection"
if [[ -z $selection ]]; then
  echo "No session selected"
  exit 0
fi

if ! echo "$sessions" | grep -q "$selection"; then
  echo "Creating new session: $selection"
  $terminal -e tmux new -s "$selection" &
  exit 1
fi

if [[ -n $selection ]]; then
  echo "Attaching to session: $selection"
  $terminal -e tmux attach -t "$selection" &
fi
