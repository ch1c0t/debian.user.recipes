execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" do
  not_if 'command -v rustup'
end

execute 'rustup component add rust-analyzer'
