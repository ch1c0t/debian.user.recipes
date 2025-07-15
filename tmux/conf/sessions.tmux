# To move between sessions faster
set-option -g detach-on-destroy off

bind -n M-a switch-client -l
bind X run-shell "tmux.close-session"

bind s display-popup \
  -w 80% \
  -h 80% \
  -E 'tmux.select-or-create-session'
