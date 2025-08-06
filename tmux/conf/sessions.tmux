# To move between sessions faster
set-option -g detach-on-destroy off

bind -n M-a run "tmux.alternate-session"
bind h run "tmux.alternate-session-outside-current-project"
bind j run "tmux.alternate-session-within-current-project"

bind x kill-pane
bind X run "tmux.close-session"
bind M-x run "tmux.close-project"

bind -n M-s display-popup \
  -w 100% \
  -h 100% \
  -E 'tmux.select-or-create'

bind g display-popup \
  -w 100% \
  -h 100% \
  -E 'tmux.select-or-create-within-current-project'
