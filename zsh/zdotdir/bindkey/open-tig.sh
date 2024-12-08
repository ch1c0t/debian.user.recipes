# https://unix.stackexchange.com/questions/668869/zsh-bindkey-to-run-command-and-hit-enterêkj
# https://unix.stackexchange.com/questions/550688/how-to-open-vim-inside-a-bash-script/550697#550697
function open-tig {
  < /dev/tty tig
  zle redisplay
}

zle -N open-tig
bindkey '\eet' open-tig
