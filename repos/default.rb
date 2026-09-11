include_recipe "../helpers"

HOME = ENV['HOME']
REPOS_ROOT = "#{HOME}/repos"
directory REPOS_ROOT

CRYSTAL_SOURCES = "#{HOME}/sources/crystal"

REPOS_SOURCEPATH = "#{CRYSTAL_SOURCES}/repos"
git REPOS_SOURCEPATH do
  repository 'https://github.com/ch1c0t/repos'
end

execute 'shards build' do
  cwd REPOS_SOURCEPATH
  not_if "test -d #{REPOS_SOURCEPATH}/bin"
end

links_in "#{HOME}/.local/bin" do
  to_each_file_in "#{REPOS_SOURCEPATH}/bin"
  only_if "test -d #{REPOS_SOURCEPATH}/bin"
end

include_recipe 'update_tree'
execute "cd #{REPOS_ROOT} && #{HOME}/.local/bin/repos"
