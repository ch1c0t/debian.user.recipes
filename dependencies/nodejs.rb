%w[
npm
pnpm
frida
coffeescript
].each do |package|
  execute "npm install --global #{package}"
end
