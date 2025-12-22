HOME = ENV['HOME']

FLUTTER_ARCHIVE = "#{HOME}/archive/flutter"
directory FLUTTER_ARCHIVE

download_command = """
curl -fsSL \
--output-dir #{FLUTTER_ARCHIVE} \
--output flutter.tar.xz \
https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.38.5-stable.tar.xz
"""

execute download_command do
  not_if "test -f #{FLUTTER_ARCHIVE}/flutter.tar.xz"
end

execute "tar -xf #{FLUTTER_ARCHIVE}/flutter.tar.xz -C #{FLUTTER_ARCHIVE}" do
  not_if "test -d #{FLUTTER_ARCHIVE}/flutter"
end
