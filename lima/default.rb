HOME = ENV['HOME']

include_recipe '../helpers'

version = "2.2.0"
url = "https://github.com/lima-vm/lima/releases/download/v#{version}/lima-#{version}-Linux-x86_64.tar.gz"

download url do
  extract true
end

links_in "#{HOME}/.local/bin" do
  to_each_file_in "#{HOME}/.local/state/mitamae/downloads/lima-#{version}-Linux-x86_64.tar.gz.extract/bin"
end

SHARED_DIRECTORY = "#{HOME}/shared"
directory SHARED_DIRECTORY

LIMA_CONFIG = "#{HOME}/.lima/_config"
file "#{LIMA_CONFIG}/default.yml" do
  content <<~S
    mounts:
    - location: "~/shared"
      mountPoint: "{{.Home}}/shared"
      writable: true
  S
end
