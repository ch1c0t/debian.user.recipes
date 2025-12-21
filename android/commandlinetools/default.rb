HOME = ENV['HOME']

ANDROID_ARCHIVE = "#{HOME}/archive/android"
directory ANDROID_ARCHIVE

download_command = """
curl -fsSL \
  --output-dir #{ANDROID_ARCHIVE} \
  --output android-commandlinetools.zip \
  https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip
"""

execute download_command do
  not_if "test -f #{ANDROID_ARCHIVE}/android-commandlinetools.zip"
end
