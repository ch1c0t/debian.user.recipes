source_directory = "#{HOME}/sources/rust/vim-helptags"
release_binary = "#{source_directory}/target/release/vim-helptags"

git :sync do
  destination source_directory
  not_if "test -d #{source_directory}"
  repository "https://github.com/ch1c0t/vim-helptags"
end

execute "cargo build --release" do
  cwd source_directory
  not_if "test -f #{release_binary}"
end

directory "#{HOME}/.local/share/vim/helptags"
remote_file "#{HOME}/.local/bin/vim-helptags" do
  source release_binary
  mode '700'
end

execute 'vim -c "helptags ALL | q"'
