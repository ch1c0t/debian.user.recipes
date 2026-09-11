HOME = ENV['HOME']

REPOS_CONFIG = "#{HOME}/.config/repos"
directory REPOS_CONFIG

REPOS_CONFIG_TREE = "#{REPOS_CONFIG}/tree.yml"
remote_file REPOS_CONFIG_TREE do
  source 'tree.yml'
end
