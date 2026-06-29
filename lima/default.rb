HOME = ENV['HOME']

include_recipe '../helpers'

version = "2.1.3"
url = "https://github.com/lima-vm/lima/releases/download/v#{version}/lima-#{version}-Linux-x86_64.tar.gz"

download url do
  extract true
end

links_in "#{HOME}/.local/bin" do
  to_each_file_in "#{HOME}/.local/state/mitamae/downloads/lima-#{version}-Linux-x86_64.tar.gz.extract/bin"
end
