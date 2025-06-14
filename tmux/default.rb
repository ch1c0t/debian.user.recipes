HOME = ENV['HOME']

directory "#{HOME}/.config/tmux"

remote_file "#{HOME}/.config/tmux/tmux.conf" do
  source 'tmux.conf'
end

include_recipe 'pane_movements'
include_recipe 'session_wizard'
