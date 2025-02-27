# https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md#searching-and-executing-history
function h {
  if [ -z "$*" ]; then
    history 1
  else
    history 1 | egrep --color=auto "$@"
  fi
}

function fh {
  eval $(fc -l 1 | fzf +s --tac | sed 's/ *[0-9]* *//')
}
