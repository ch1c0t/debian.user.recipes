if [[ ! $DISPLAY && $XDG_VTNR -eq 3  ]]; then
  export TERMINAL="sakura"
  exec startx
fi

if [ -n "$TMUX" ]; then
  tmux_array=("${(@s:,:)TMUX}")

  tmux_socket=$tmux_array[1]
  tmux_pid=$tmux_array[2]
  tmux_session=$tmux_array[3]

  # echo $tmux_socket
  # echo $tmux_pid
  # echo $tmux_session

  tmux_panes="$tmux_socket.panes"
  tmux_pane_path="$tmux_panes/${TMUX_PANE:1}"
  mkdir -p $tmux_pane_path

  # tmux pipe-pane -o "cat >>$tmux_pane_path/log"
  echo "PPID: $PPID"
  echo "\$\$: $$"
fi
