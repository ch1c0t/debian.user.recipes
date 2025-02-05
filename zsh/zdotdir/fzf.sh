export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--reverse --height 100%'

. $(dirname $0)/fzf/change-directory.sh
. $(dirname $0)/fzf/edit-file.sh
. $(dirname $0)/fzf/search-man.sh
