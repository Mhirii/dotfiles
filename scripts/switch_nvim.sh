#!/usr/bin/env bash

configs=(
  lazyvim
  astrovim
)

echo_colored() {
  case $2 in
  "red")
    printf "\e[31m%s\e[0m" "$1"
    ;;
  "green")
    printf "\e[32m%s\e[0m" "$1"
    ;;
  "yellow")
    printf "\e[33m%s\e[0m" "$1"
    ;;
  "blue")
    printf "\e[34m%s\e[0m" "$1"
    ;;
  "purple")
    printf "\e[35m%s\e[0m" "$1"
    ;;
  "cyan")
    printf "\e[36m%s\e[0m" "$1"
    ;;
  "white")
    printf "\e[37m%s\e[0m" "$1"
    ;;
  *)
    printf "\e[37m%s\e[0m" "$1"
    ;;
  esac
}
echo_error() {
  echo_colored "$1" "red"
}

find_current() {
  cd "$HOME/.config/nvim" || exit
  current=$(cat .git/config | rg url | awk '{print $3}' | sed 's/.*\///')
  echo "$current"
}

validate_config() {
  config=$1
  if [ ! -d "$HOME/.config/$config" ]; then
    echo_error "$HOME/.config/$config does not exist"
    exit 1
  fi
  if [ ! -d "$HOME/.local/share/$config" ]; then
    echo_error "$HOME/.local/share/$config does not exist"
    exit 1
  fi
  if [ ! -d "$HOME/.local/state/$config" ]; then
    echo_error "$HOME/.local/state/$config does not exist"
    exit 1
  fi
  echo "$1"
}

switch_config() {
  current=$1
  target=$2
  mv "$HOME/.config/nvim" "$HOME/.config/$current"
  mv "$XDG_DATA_HOME/nvim" "$XDG_DATA_HOME/$current"
  mv "$XDG_STATE_HOME/nvim" "$XDG_STATE_HOME/$current"
  mv "$XDG_CACHE_HOME/nvim" "$XDG_CACHE_HOME/$current"

  mv "$HOME/.config/$target" "$HOME/.config/nvim"
  mv "$XDG_DATA_HOME/$target" "$XDG_DATA_HOME/nvim"
  mv "$XDG_STATE_HOME/$target" "$XDG_STATE_HOME/nvim"
  mv "$XDG_CACHE_HOME/$target" "$XDG_CACHE_HOME/nvim"
}

current=$(find_current)
target=$(echo "${configs[@]}" | tr ' ' '\n' | fzf)
if [ -z "$target" ]; then
  echo_error "No config selected"
  exit 1
fi

valid=$(validate_config "$target")
echo "switching from $current to $valid "

switch_config "$current" "$target"
