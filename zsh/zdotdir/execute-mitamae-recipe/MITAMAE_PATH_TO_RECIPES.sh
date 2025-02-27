if [[ $UID == 0 ]]; then
  export MITAMAE_PATH_TO_RECIPES=~/recipes
else
  if [[ -d "$HOME/user.recipes" ]]; then
    export MITAMAE_PATH_TO_RECIPES=~/user.recipes
  else
    export MITAMAE_PATH_TO_RECIPES=~/recipes
  fi
fi
