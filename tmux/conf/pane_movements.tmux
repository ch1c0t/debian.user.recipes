# Moving between panes
# https://unix.stackexchange.com/questions/283759/tmux-how-to-bind-a-key-to-launch-shell-command/480965#480965
bind -n M-h run-shell "to-left-pane"
bind -n M-j run-shell "to-lower-pane"
bind -n M-k run-shell "to-upper-pane"
bind -n M-l run-shell "to-right-pane"
