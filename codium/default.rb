HOME = ENV['HOME']

link "#{HOME}/.local/bin/code" do
  to '/usr/bin/codium'
end

remote_file "#{HOME}/.config/VSCodium/User/settings.json" do
  source 'settings.json'
end

extensions = [
  'DanielX.civet',
  'asvetliakov.vscode-neovim',
]

extensions.each do |name|
  execute "code --install-extension #{name}"
end
