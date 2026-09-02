HOME = ENV['HOME']

execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" do
  not_if 'command -v rustup'
end

execute "#{HOME}/.cargo/bin/rustup component add rust-analyzer"

include_recipe 'crates'
