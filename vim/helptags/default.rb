directory "#{HOME}/.local/share/vim/helptags"

remote_file "#{HOME}/.local/bin/vim-helptags" do
  source "#{HOME}/sources/rust/vim-helptags/target/release/vim-helptags"
  mode '700'
end
