# To move between sessions faster
set-option -g detach-on-destroy off

bind -n M-a run "tmux.alternate-session"
bind X run "tmux.close-session"
bind x kill-pane

bind -n M-s display-popup \
  -w 100% \
  -h 100% \
  -E 'tmux.select-or-create-session'
