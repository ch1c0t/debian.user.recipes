execute '~/.local/bin/mise use -g node@24'

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
  execute "npm install --global https://github.com/ch1c0t/#{package}#main"
end
