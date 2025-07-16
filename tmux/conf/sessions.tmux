# To move between sessions faster
set-option -g detach-on-destroy off

bind -n M-a switch-client -l
bind X run-shell "tmux.close-session"
bind x kill-pane

bind -n M-s display-popup \
  -w 80% \
  -h 80% \
  -E 'tmux.select-or-create-session'

run "zoxide query --list > /dev/null &" # to precache
