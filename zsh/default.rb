HOME = ENV['HOME']

remote_file "#{HOME}/.zshenv" do
  source 'zdotdir/.zshenv'
end

remote_directory "#{HOME}/.config/zsh" do
  source 'zdotdir'
end

directory "#{HOME}/.local/share/zsh"
directory "#{HOME}/.cache/zsh"

template "#{HOME}/.config/zsh/zsh.d/scrcpy.sh"
