HOME = ENV['HOME']
dir = "#{HOME}/archive/scrcpy-linux"
version = 'x86_64-v3.1-5689'
subdir_name = "scrcpy-linux-#{version}"
url = "https://tmp.rom1v.com/scrcpy/5689/1/#{subdir_name}.tar.gz"

p node[:android][:scrcpy][:version]

commands = """
mkdir -p #{dir}
curl --fail -L #{url} | tar xzfv - -C #{dir}
"""

execute commands do
  not_if "test -d #{dir}/#{subdir_name}"
end
