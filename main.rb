HOME = ENV['HOME']

include_recipe 'helpers'

include_recipe 'directories'
include_recipe 'config'
include_recipe 'zsh'
include_recipe 'git'
include_recipe 'htop'
include_recipe 'tmux'

include_recipe 'i3'
include_recipe 'gtk'
include_recipe 'fonts'
include_recipe 'sakura'

include_recipe 'mise'
include_recipe 'dependencies'
include_recipe 'repos'

include_recipe 'vim'
include_recipe 'neovim'
include_recipe 'codium'

include_recipe 'redis'
include_recipe 'lavinmq'
include_recipe 'systemd'
