execute '~/.local/bin/mise use -g python@3.14'
execute '~/.local/bin/mise use -g uv@latest'

%w[
pip
"redis[hiredis]"
frida-tools
frida
pynvim
yt-dlp
ffmpeg-normalize
litecli
].each do |package|
  execute "pip install #{package} --upgrade"
end
