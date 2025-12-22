HOME = ENV['HOME']

ANDROID_ARCHIVE = "#{HOME}/archive/android"
directory ANDROID_ARCHIVE

download_command = """
curl -fsSL \
  --output-dir #{ANDROID_ARCHIVE} \
  --output commandlinetools.zip \
  https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip
"""

execute download_command do
  not_if "test -f #{ANDROID_ARCHIVE}/commandlinetools.zip"
end

execute "unzip #{ANDROID_ARCHIVE}/commandlinetools.zip -d #{ANDROID_ARCHIVE}" do
  not_if "test -d #{ANDROID_ARCHIVE}/cmdline-tools"
end

ANDROID_DIR_FOR_LATEST_CMDLINETOOLS = "#{HOME}/android.sdk/cmdline-tools"
directory ANDROID_DIR_FOR_LATEST_CMDLINETOOLS
execute "cp -a #{ANDROID_ARCHIVE}/cmdline-tools #{ANDROID_DIR_FOR_LATEST_CMDLINETOOLS}/latest" do
  not_if "test -d #{ANDROID_DIR_FOR_LATEST_CMDLINETOOLS}/latest"
end
