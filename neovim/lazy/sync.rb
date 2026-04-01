HOME = ENV['HOME']
NVIM_CONFIG = "#{HOME}/.config/nvim"

execute "nvim --headless -c 'source #{NVIM_CONFIG}/lua/lazy/sync.lua'"
