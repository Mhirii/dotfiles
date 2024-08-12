#!/usr/bin/env bash

command="git fetch --all"
if [ -n "$1" ] && [ "$1" = "pull" ]; then
  command="git pull"
fi

repos=$(cd && fd config --hidden --exclude ".local" --exclude ".cache" --exclude ".tmux" | rg .git/config)

failed_repos=()
for r in $repos; do
  echo
  dir="$HOME/${r%/.git/config}"
  echo -e "\e[33m  Updating $dir\e[0m"
  cd "$dir" || continue
  $command
  if [ $? -eq 0 ]; then
    echo -e "\e[32m  SUCCESS\e[0m"
  else
    echo -e "\e[31m  FAILURE\e[0m"
    failed_repos+=("$dir")
  fi
  echo
done

if [ ${#failed_repos[@]} -ne 0 ]; then
  echo -e "\e[31mFailed repositories:\e[0m"
  for repo in "${failed_repos[@]}"; do
    echo "  $repo"
  done
fi
