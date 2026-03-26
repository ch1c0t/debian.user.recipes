execute '~/.local/bin/mise use -g python@3.14'
execute '~/.local/bin/mise use -g uv@latest'

%w[
pynvim
yt-dlp
litecli
ffmpeg-normalize
"redis[hiredis]"
].each do |package|
  execute "pip install #{package}"
end

%w[
marimo
].each do |package|
  execute "pip install '#{package}[recommended]' --upgrade"
end
