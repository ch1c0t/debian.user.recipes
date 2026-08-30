execute '~/.local/bin/mise use -g node@24'

%w[
npm
pnpm
frida
coffeescript
].each do |package|
  execute "npm install --global #{package}"
end

%w[
hobby-rpc.servers.nodejs
hobby-rpc.clients.nodejs
hobby-rpc.clients.js
coffeelib
].each do |package|
  execute "npm install --global https://github.com/ch1c0t/#{package}#main"
end
