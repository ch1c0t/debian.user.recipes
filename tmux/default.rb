HOME = ENV['HOME']
TMUX_SOURCES = "#{HOME}/sources/tmux"

directory TMUX_SOURCES
directory "#{HOME}/.config/tmux"

remote_file "#{HOME}/.config/tmux/tmux.conf" do
  source 'tmux.conf'
end

include_recipe 'pane_movements'
include_recipe 'scripts'

include_recipe 'session_wizard'
include_recipe 'fingers'
