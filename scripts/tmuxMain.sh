#!/usr/bin/env bash

tmux new-session -d -s main
tmux send-keys 'btop' 'C-m'
tmux rename-window 'btop'

tmux new-window -n 'spotify'
tmux send-keys 'spt' 'C-m'

# tmux split-window -h 'cava'
# tmux send-keys 'cava' 'C-m'

tmux select-window -t 1
tmux a
