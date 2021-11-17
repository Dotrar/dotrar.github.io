#!/bin/bash

session="LispMachine"

tmux new-session -d -s $session
tmux rename-window -t 0 'lispmachine'
tmux send-keys -t 'lispmachine' 'nvim' C-m
tmux split-window -v -l 10
tmux send-keys './fennel' C-m
tmux attach -t $session:0
