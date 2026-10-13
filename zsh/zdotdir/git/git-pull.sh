# Define widget to run git pull directly
run-git-pull() {
  BUFFER=" git log -1 --oneline && git pull"
  zle accept-line
}
zle -N run-git-pull

# Bind to F5 or a custom shortcut
bindkey '^[[15~' run-git-pull  # F5 key on many terminals
