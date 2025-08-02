HOME = ENV['HOME']
TMUX_SOURCES = "#{HOME}/sources/tmux"

include_recipe "../helpers"

directory TMUX_SOURCES

remote_directory "#{HOME}/.config/tmux" do
  source 'conf'
end

include_recipe 'scripts'
include_recipe 'sessions'
include_recipe 'pane_movements'
