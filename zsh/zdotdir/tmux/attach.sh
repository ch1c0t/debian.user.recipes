# https://stackoverflow.com/questions/37597191/zsh-attach-to-tmux-by-key-binding/76913786#76913786
function tmux-attach {
(
  exec </dev/tty
  exec <&1
  tmux attach
)
}

zle -N tmux-attach
bindkey '\eta' tmux-attach
