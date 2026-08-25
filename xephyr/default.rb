include_recipe "../helpers"

HOME = ENV['HOME']
CRYSTAL_SOURCES = "#{HOME}/sources/crystal"

XEPHYRD_SOURCEPATH = "#{CRYSTAL_SOURCES}/xephyr-run"
git XEPHYRD_SOURCEPATH do
  repository 'https://github.com/ch1c0t/xephyr-run'
end

execute 'shards build' do
  cwd XEPHYRD_SOURCEPATH
  not_if "test -d #{XEPHYRD_SOURCEPATH}/bin"
end

links_in "#{HOME}/.local/bin" do
  to_each_file_in "#{XEPHYRD_SOURCEPATH}/bin"
  only_if "test -d #{XEPHYRD_SOURCEPATH}/bin"
end
