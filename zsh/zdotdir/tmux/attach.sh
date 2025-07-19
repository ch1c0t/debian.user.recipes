function tmux-attach {
(
  exec </dev/tty
  exec <&1
  tmux attach
)
}

zle -N tmux-attach
bindkey '\ea' tmux-attach
