HOME = ENV['HOME']
dir = "#{HOME}/archive/scrcpy-linux"
version = 'x86_64-v3.1'
subdir_name = "scrcpy-linux-#{version}"
url = "https://github.com/Genymobile/scrcpy/releases/download/v3.1/#{subdir_name}.tar.gz"

commands = """
mkdir -p #{dir}
curl --fail -L #{url} | tar xzfv - -C #{dir}
"""

execute commands do
  not_if "test -d #{dir}/#{subdir_name}"
end
