%w[
zoxide
eza
hexyl
].each do |crate|
  execute "cargo install #{crate}"
end
