HOME = ENV['HOME']

execute "curl https://mise.run | sh" do
  not_if "test -f #{HOME}/.local/bin/mise"
end

execute '~/.local/bin/mise use -g crystal'
execute '~/.local/bin/mise use -g node@24'
execute '~/.local/bin/mise use -g ruby@3.4'
execute '~/.local/bin/mise use -g python@3.14'
execute '~/.local/bin/mise use -g uv@0.11'
