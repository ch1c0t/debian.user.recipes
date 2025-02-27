. $(dirname $0)/execute-mitamae-recipe/MITAMAE_PATH_TO_RECIPES.sh
. $(dirname $0)/execute-mitamae-recipe/all-paths-to-recipes.sh
. $(dirname $0)/execute-mitamae-recipe/execute-mitamae-recipe-at.sh

# To fuzzy-choose recipes interactively and execute them.
function execute-mitamae-recipe {
  local path_to_recipe=$(all-paths-to-recipes | fzf)

  if [ -n "$path_to_recipe" ]; then
    execute-mitamae-recipe-at "$path_to_recipe"
    zle accept-line
  fi
}

zle -N execute-mitamae-recipe
bindkey '\em' execute-mitamae-recipe
