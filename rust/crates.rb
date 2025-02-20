%w[
zoxide
hexyl
].each do |crate|
  execute "cargo install #{crate}"
end
