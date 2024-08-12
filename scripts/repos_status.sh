#!/usr/bin/env bash

repos=$(cd && fd config --hidden --exclude ".local" --exclude ".cache" --exclude ".tmux" | rg .git/config)

uncommitted_repos=()
unpushed_repos=()
for r in $repos; do
  echo
  dir="$HOME/${r%/.git/config}"
  echo -e "\e[33m  Checking $dir\e[0m"
  cd "$dir" || continue

  # Uncommitted changes
  if ! git diff-index --quiet HEAD --; then
    echo -e "\e[31m  Uncommitted changes found\e[0m"
    uncommitted_repos+=("$dir")
  fi

  # Commits not pushed
  branch=$(git rev-parse --abbrev-ref HEAD)
  if [ "$(git log origin/$branch..$branch)" ]; then
    echo -e "\e[31m  Unpushed commits found on branch $branch\e[0m"
    unpushed_repos+=("$dir")
  fi
  echo
done

if [ ${#uncommitted_repos[@]} -ne 0 ]; then
  echo -e "\e[31mRepositories with uncommitted changes:\e[0m"
  for repo in "${uncommitted_repos[@]}"; do
    echo "  $repo"
  done
fi

if [ ${#unpushed_repos[@]} -ne 0 ]; then
  echo -e "\e[31mRepositories with unpushed commits:\e[0m"
  for repo in "${unpushed_repos[@]}"; do
    echo "  $repo"
  done
fi
