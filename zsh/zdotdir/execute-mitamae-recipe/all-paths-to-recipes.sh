function all-paths-to-recipes {
  local top_level_files=$(rg --files $MITAMAE_PATH_TO_RECIPES/*.{rb,list}(N))
  local directories=$(fd --type directory --max-depth 2 -a . "$MITAMAE_PATH_TO_RECIPES")
  local second_level_files=$(rg --files $MITAMAE_PATH_TO_RECIPES/*/*.rb(N))
  local third_level_files=$(rg --files $MITAMAE_PATH_TO_RECIPES/*/*/*.rb(N))

  printf "%s\n" \
    $top_level_files \
    $directories \
    $second_level_files \
    $third_level_files
}
