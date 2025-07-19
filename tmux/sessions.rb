TMUX_SOCS = "#{TMUX_SOURCES}/tmux.select-or-create-session"
git TMUX_SOCS do
  repository 'https://github.com/ch1c0t/tmux.select-or-create-session'
end

TMUX_SOCS_BINARY = "#{TMUX_SOCS}/bin/tmux.select-or-create-session"
execute 'shards build --release' do
  cwd TMUX_SOCS
  not_if {
    File.exist? TMUX_SOCS_BINARY
  }
end

link "#{HOME}/.local/bin/tmux.select-or-create-session" do
  to TMUX_SOCS_BINARY
end

link "#{HOME}/.local/bin/tmux.alternate-session" do
  to "#{TMUX_SOCS}/bin/tmux.alternate-session"
end
