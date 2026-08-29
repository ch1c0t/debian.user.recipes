HOME = ENV['HOME']

execute '~/.local/bin/mise use -g node@24'
execute '~/.local/bin/mise use -g aube'

AUBE_CONFIG ="#{HOME}/.config/aube"
directory AUBE_CONFIG
file "#{AUBE_CONFIG}/config.toml" do
  content <<~S
    blockExoticSubdeps = false
  S
end

%w[
npm
pnpm
frida
coffeescript
hobby-rpc.server
hobby-rpc.client
hobby-rpc
coffeelib
].each do |package|
  execute "npm install --global #{package}"
end

%w[
hobby-rpc.server
hobby-rpc.client
hobby-rpc
coffeelib
].each do |package|
  execute "aube add --global github:ch1c0t/#{package}"
end
