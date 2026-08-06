export HISTFILE=~/.local/share/zsh/history
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt hist_expire_dups_first
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# eval "$(atuin init zsh)"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

. $(dirname $0)/history/functions.sh
