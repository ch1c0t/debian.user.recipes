%w[
].each do |crate|
  execute "cargo install #{crate}"
end
