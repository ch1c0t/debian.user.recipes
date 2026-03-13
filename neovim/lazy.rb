NVIMSHARE = "#{HOME}/.local/share/nvim"
LAZYPATH = "#{NVIMSHARE}/lazy"
LAZYSOURCEPATH = "#{LAZYPATH}/lazy.nvim"
LAZYREPO = 'https://github.com/folke/lazy.nvim.git'

directory LAZYPATH
execute "git clone --filter=blob:none --branch=stable #{LAZYREPO} #{LAZYSOURCEPATH}" do
  not_if "test -d #{LAZYSOURCEPATH}"
end

execute "nvim --headless -c 'source #{NVIM_CONFIG}/lua/lazy/sync.lua'"
execute "nvim --headless -c 'UpdateRemotePlugins' -c 'qall!'"
