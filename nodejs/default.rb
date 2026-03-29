execute '~/.local/bin/mise use -g node@24'

%w[
npm
pnpm
frida
coffeescript
].each do |package|
  execute "npm install --global #{package}"
end
