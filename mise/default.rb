HOME = ENV['HOME']

execute "curl https://mise.run | sh" do
  not_if "test -f #{HOME}/.local/bin/mise"
end
