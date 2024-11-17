HOME = ENV['HOME']

include_recipe 'base'
include_recipe 'zsh'
include_recipe 'tmux'
include_recipe 'git'
include_recipe 'htop'

include_recipe 'i3'
include_recipe 'gtk'

include_recipe 'mise'
include_recipe 'nodejs'
include_recipe 'ruby'

include_recipe 'clipboard'

include_recipe 'rust'
include_recipe 'vim'
