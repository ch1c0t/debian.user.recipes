HOME = ENV['HOME']
NVIM_CONFIG = "#{HOME}/.config/nvim"

remote_directory NVIM_CONFIG do
  source 'config'
end

DIR = File.dirname __FILE__
MOON = "#{DIR}/config/moon"

execute "cd #{MOON} && moonc -t #{NVIM_CONFIG}/lua ."
execute "cd #{NVIM_CONFIG}/snippets && moonc -t . ."

include_recipe 'lazy'

execute "nvim --headless -c 'UpdateRemotePlugins' -c 'qall!'"
