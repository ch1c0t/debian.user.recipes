function all-paths-to-recipes {
  local files=$(rg --files $MITAMAE_PATH_TO_RECIPES/*.{rb,list}(N))
  local directories=$(fd --type directory --max-depth 2 -a . "$MITAMAE_PATH_TO_RECIPES")

  printf $files"\n"$directories"\n"
}
