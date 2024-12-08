# https://unix.stackexchange.com/questions/668869/zsh-bindkey-to-run-command-and-hit-enter
function open-tig {
  tig
  zle redisplay
}

zle -N open-tig
bindkey '\eet' open-tig
