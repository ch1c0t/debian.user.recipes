# https://unix.stackexchange.com/questions/746605/bindkey-commands-run-in-zshrc-seem-ignored-when-in-tmux/746633#746633
bindkey -e

bindkey '^j' autosuggest-execute
bindkey '\ev' vi-cmd-mode
bindkey -s '\eeh' '^l bindkey -l^M'

. $(dirname $0)/bindkey/open-tig.sh
