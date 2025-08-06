# To move between sessions faster
set-option -g detach-on-destroy off

bind -n M-a run "tmux.alternate-session"
bind h run "tmux.alternate-session-outside-current-project"
bind j run "tmux.alternate-session-within-current-project"

bind X run "tmux.close-session"
bind x kill-pane
bind M-x run "tmux.close-project"

bind -n M-s display-popup \
  -w 100% \
  -h 100% \
  -E 'tmux.select-or-create'
