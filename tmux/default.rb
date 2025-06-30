HOME = ENV['HOME']
TMUX_SOURCES = "#{HOME}/sources/tmux"

directory TMUX_SOURCES

remote_directory "#{HOME}/.config/tmux" do
  source 'conf'
end

include_recipe 'scripts'
include_recipe 'pane_movements'
include_recipe 'session_wizard'
