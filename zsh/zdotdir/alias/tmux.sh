alias tm="tmuxinator"
alias t="~/sources/tmux/tmux-session-wizard/bin/t"

function tmux-session-wizard {
  ~/sources/tmux/tmux-session-wizard/bin/t
}

zle -N tmux-session-wizard
bindkey '\et' tmux-session-wizard
