%w[
hexyl
].each do |crate|
  execute "cargo install #{crate}"
end
