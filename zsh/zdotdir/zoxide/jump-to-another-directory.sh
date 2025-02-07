function jump-to-another-directory {
  local dir=$(zoxide query --list --exclude $(pwd) | fzf)

  if [ -n "$dir" ]; then
    cd $dir
    zle accept-line
  fi
}

zle -N jump-to-another-directory
bindkey '\ez' jump-to-another-directory
