#!/bin/sh
#
# Attach or create three types of tmux sessions:
# 1. When no arguments, a session is created based on the current work directory name
# 2. With one argument, it creates a session based on the argument given
# 3. With two arguments, check that the second argument is 1, if it is 1, a dev session is created


arg1=$1
arg2=$2

not_in_tmux() {
  [ -z "$TMUX" ]
}

session_exists() {
  tmux has-session -t "=$session_name"
}

create_detached_session() {
  tmux new-session -Ad -s "$session_name"
}

set_session_name() {
  if [ -z "$arg1" ]; then
    echo "Session name empty, current work directory name will be used"
    path_name="$(basename "$PWD" | tr . -)"
    session_name=${1-$path_name}
  else
    session_name=$arg1
    echo "Session name set to $session_name"
  fi
}

create_if_needed_and_attach() {
  set_session_name
  tmux source-file ~/.tmux.conf
  if ! session_exists; then
    if [ -z "$arg1" ]; then
      #tmux new-session -As "$session_name"
      create_detached_session
    else
      if [ "$arg2" != "1" ]; then
        #tmux new-session -As "$session_name"
        create_detached_session
      else
        create_develop
      fi
    fi
  fi

  tmux a -t "$session_name"
}

create_develop() {
  tmux new-session -A -s $arg1 -n editor -d
  tmux send-keys -t $arg1 'cd ~/' C-m
  tmux send-keys -t $arg1 'vi -O2' C-m
  tmux new-window -n console -t $arg1
  tmux split-window -h -t $arg1
  tmux send-keys -t $arg1:2.1 'cd ~/' C-m
  tmux send-keys -t $arg1:2.1 'clear' C-m
  tmux send-keys -t $arg1:2.2 'cd ~/' C-m
  tmux send-keys -t $arg1:2.2 'clear' C-m
  tmux select-pane -t $arg1:2.1
  tmux select-window -t $arg1:1
}

create_if_needed_and_attach
