run-git-push() {
  BUFFER=" git push origin main"
  zle accept-line
}
zle -N run-git-push

# Bind to F6 or a custom shortcut
bindkey '^[[17~' run-git-push
