execute '~/.local/bin/mise use -g node@24'

%w[
npm
pnpm
frida
coffeescript
].each do |package|
  execute "npm install --global #{package}"
end

include_recipe '../repos'

%w[
coffeelib
hobby-rpc.servers.nodejs
hobby-rpc.clients.nodejs
hobby-rpc.clients.js
].each do |package|
  execute "cd #{REPOS_ROOT}/github/ch1c0t/#{package} && npm install && npm install --global ."
end
