TMUX_SOURCES = "#{HOME}/sources/tmux"
directory TMUX_SOURCES

git "#{TMUX_SOURCES}/tmux-session-wizard" do
  repository 'https://github.com/27medkamal/tmux-session-wizard'
end
