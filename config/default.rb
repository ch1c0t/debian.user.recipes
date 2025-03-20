HOME = ENV['HOME']
file = "#{HOME}/.config/recipes/node.yml"

directory "#{HOME}/.config/recipes"
remote_file file do
  source 'default.node.yml'
  not_if "test -f #{file}"
end
