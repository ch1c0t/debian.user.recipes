function edit-file {
  local file
  file=$(fd --type f --strip-cwd-prefix --hidden --exclude .git | fzf --reverse --height 100% --preview 'batcat -n --color=always {}')

  if [ -n "$file" ]; then
    # https://unix.stackexchange.com/questions/550688/how-to-open-vim-inside-a-bash-script/550697#550697
    < /dev/tty ${EDITOR} "$file"
  fi
}

zle -N edit-file
bindkey '\eef' edit-file

function edit-file-with-neovim {
  (
    EDITOR=nvim
    edit-file
  )
}

zle -N edit-file-with-neovim
bindkey '^p' edit-file-with-neovim
