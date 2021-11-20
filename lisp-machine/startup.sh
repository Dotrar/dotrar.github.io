#!/bin/bash

tmux new-session -d
tmux new-window
tmux split-window -v -l 10 '~/fennel'
tmux attach-session
