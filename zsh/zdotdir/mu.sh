function execute-mitamae-recipe {
  local dir
  if [[ -d "$HOME/user.recipes" ]]; then
    dir=~/user.recipes
  else
    dir=~/recipes
  fi; cd "$dir"

  local file
  file=$(rg --files *.rb | fzf)

  if [ -n "$file" ]; then
    mitamae local "$file"
    zle accept-line
  fi
}

zle -N execute-mitamae-recipe
bindkey '\em' execute-mitamae-recipe
