%w[
moonscript
inspect
].each do |package|
  execute "luarocks install #{package} --local"
end
