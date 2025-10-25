execute '~/.local/bin/mise use -g python@3.14'
execute '~/.local/bin/mise use -g uv@latest'

%w[
yt-dlp
litecli
ffmpeg-normalize
].each do |package|
  execute "pip install #{package}"
end
