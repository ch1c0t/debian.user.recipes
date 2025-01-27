export HISTFILE=~/.local/share/zsh/history
export HISTSIZE=100000
export SAVEHIST=100000

setopt hist_expire_dups_first
setopt appendhistory
setopt sharehistory
setopt incappendhistory

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

function h {
  if [ -z "$*" ]; then
    history 1
  else
    history 1 | egrep --color=auto "$@"
  fi
}
