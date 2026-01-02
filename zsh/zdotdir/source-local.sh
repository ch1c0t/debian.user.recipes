function source-local {
  local wd="$PWD"
  local dir="$wd/.zsh.d"

  if [[ -d "$dir" ]]; then
    for f in $dir/*.{sh,zsh}(N); do
      source $f
    done
  fi
}

source-local
autoload -U add-zsh-hook
add-zsh-hook chpwd source-local
