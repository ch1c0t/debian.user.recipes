TMUX_SOC = "#{TMUX_SOURCES}/tmux.select-or-create"
git TMUX_SOC do
  repository 'https://github.com/ch1c0t/tmux.select-or-create'
end

execute "zsh -c 'shards build'" do
  cwd TMUX_SOC
  not_if "test -d #{TMUX_SOC}/bin"
end

links_in "#{HOME}/.local/bin" do
  to_each_file_in "#{TMUX_SOC}/bin"
  only_if "test -d #{TMUX_SOC}/bin"
end
