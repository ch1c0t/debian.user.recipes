remote_file "#{HOME}/.local/bin/tmux.close-session" do
  source 'tmux.close-session'
  mode '700'
end

remote_file "#{HOME}/.local/bin/tmux.startup" do
  source 'tmux.startup'
  mode '700'
end
