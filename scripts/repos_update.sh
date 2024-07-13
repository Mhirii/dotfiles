#!/bin/bash

command="git fetch --all"
if [ -n "$1" ] && [ "$1" = "pull" ]; then
  command="git pull"
fi

repos=$(cd && fd config --hidden --exclude ".local" --exclude ".cache" --exclude ".tmux" | rg .git/config)
for r in $repos; do
  dir="$HOME/${r%/.git/config}"
  echo "Updating $dir"
  cd "$dir" || exit
  $command
done
