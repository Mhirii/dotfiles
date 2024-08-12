#!/usr/bin/env bash
# ── Options ─────────────────────────────────────────────────────
nvchad=1
lazyvim=1
astrovim=1
normalnvim=0

declare -A config_vars
config_vars=(["nvchad"]=$nvchad ["lazyvim"]=$lazyvim ["astrovim"]=$astrovim ["normalnvim"]=$normalnvim)

verbose=0

# ── Utils ───────────────────────────────────────────────────────{{{
verboseEcho() {
  if [[ $verbose -eq 1 ]]; then
    echo_colored "$1" "$2"
    echo
  fi
}

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

echo_warning() {
  echo "$(echo_colored "[Warning]:" "yellow") $(echo_colored "$1" "white")"
}

echo_error() {
  echo_colored "╭── Error: ──────────────────────────────────────────────────────────╮" "red"
  echo
  echo -e "\t$1"
  echo
  echo_colored "╰────────────────────────────────────────────────────────────────────╯" "red"
}

str_length() {
  echo ${#1}
}

fill_string() {
  character=$1
  number=$2
  str=""
  for ((i = 0; i < number; i++)); do
    str="$str$character"
  done
  echo "$str"
}

# ────────────────────────────────────────────────────────────────}}}

# ── Checks ──────────────────────────────────────────────────────{{{
check_fzf() {
  has_fzf=0
  if command -v fzf &>/dev/null; then
    has_fzf=1
  fi
}
# ────────────────────────────────────────────────────────────────}}}

find_dir() {
  dir_name=$1
  dir_path="$HOME/.config/$dir_name"
  if [ ! -d "$dir_path" ]; then
    return
  else
    echo "$dir_path"
  fi
}

select_config() {
  if [[ $has_fzf -eq 1 ]]; then
    selected_config=$(echo "${nvim_configs[@]}" | tr ' ' '\n' | fzf)
    if [ -z "$selected_config" ]; then
      echo_error "No config selected"
      exit 1
    fi
  else
    echo_error "fzf is not installed"
  fi
}

find_current_config() {

  current_config=""
  for config in "$@"; do
    dir_path=$(find_dir $config)
    if [ -z "$dir_path" ]; then
      verboseEcho "$config does not exist" "yellow"
      if [ -z "$current_config" ]; then
        current_config=$config
      else
        echo_error "More than one config is missing"
        exit 1
      fi
    fi
  done
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
}

switch_config() {
  existing_config=$1
  new_config=$2
  validate_config "nvim"
  validate_config "$new_config"

  verboseEcho "Switching from $existing_config to $new_config" "cyan"

  verboseEcho "Moving nvim to $HOME/.config/$existing_config" "green"
  mv "$HOME/.config/nvim" "$HOME/.config/$existing_config"

  verboseEcho "Moving nvim to $HOME/.local/share/$existing_config" "green"
  mv "$HOME/.local/share/nvim" "$HOME/.local/share/$existing_config"

  verboseEcho "Moving nvim to $HOME/.local/state/$existing_config" "green"
  mv "$HOME/.local/state/nvim" "$HOME/.local/state/$existing_config"

  verboseEcho "Moving nvim to $HOME/.cache/$existing_config" "green"
  mv "$HOME/.cache/nvim" "$HOME/.cache/$existing_config"

  verboseEcho "Moving $new_config to $HOME/.config/nvim" "green"
  mv "$HOME/.config/$new_config" "$HOME/.config/nvim"

  verboseEcho "Moving $new_config to $HOME/.local/share/nvim" "green"
  mv "$HOME/.local/share/$new_config" "$HOME/.local/share/nvim"

  verboseEcho "Moving $new_config to $HOME/.local/state/nvim" "green"
  mv "$HOME/.local/state/$new_config" "$HOME/.local/state/nvim"

  verboseEcho "Moving $new_config to $HOME/.cache/nvim" "green"
  mv "$HOME/.cache/$new_config" "$HOME/.cache/nvim"
}

# ╭──────────────────────────────────────────────────────────╮
# │                           main                           │
# ╰──────────────────────────────────────────────────────────╯

nvim_configs=()

for config in "${!config_vars[@]}"; do
  if [ "${config_vars[$config]}" -eq 1 ]; then
    nvim_configs+=("$config")
  fi
done

check_fzf
select_config
verboseEcho "selected: $selected_config" "blue"

find_current_config "${nvim_configs[@]}"
verboseEcho "current_config: $current_config" "cyan"
switch_config "$current_config" "$selected_config"

# ╭──────────────────────────────────────────────────────────╮
# │                          Result                          │
# ╰──────────────────────────────────────────────────────────╯

current_config_length=$(str_length "$current_config")
current_config_whitespaces=$(fill_string " " "$current_config_length")
current_config_lines=$(fill_string "─" "$current_config_length")
selected_config_length=$(str_length "$selected_config")
selected_config_whitespaces=$(fill_string " " "$selected_config_length")
selected_config_lines=$(fill_string "─" "$selected_config_length")

echo
echo_colored "    ╭── DONE: " "green"
echo_colored "$current_config_lines" "green"
echo_colored "$selected_config_lines" "green"
echo_colored "─────────────────────────────────────╮" "green"
echo

echo_colored "    │" "green"
printf "%s%s%s%s" "$(fill_string " " 8)" "$current_config_whitespaces" "$selected_config_whitespaces" "$(fill_string " " 38)"
echo_colored "│" "green"
echo

echo_colored "    │      " "green"
echo_colored "Switched from: " "white"
echo_colored "$current_config " "red"
echo_colored "to: " "white"
echo_colored "$selected_config" "green"
echo_colored "$(fill_string " " 19) │" "green"
echo_colored
echo

echo_colored "    │" "green"
printf "%s%s%s%s" "$(fill_string " " 8)" "$current_config_whitespaces" "$selected_config_whitespaces" "$(fill_string " " 38)"
echo_colored "│" "green"
echo

echo_colored "    ╰─────────" "green"
echo_colored "$current_config_lines" "green"
echo_colored "$selected_config_lines" "green"
echo_colored "─────────────────────────────────────╯" "green"
echo
