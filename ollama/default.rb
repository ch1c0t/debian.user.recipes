HOME = ENV['HOME']

execute '~/recipes/ollama/download.sh' do
  not_if 'test -e ~/.local/bin/ollama'
end

remote_file "#{HOME}/.config/systemd/user/ollama.service" do
  source 'ollama.service'
end
