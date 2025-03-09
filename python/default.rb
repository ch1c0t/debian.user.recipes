execute '~/.local/bin/mise use -g python@3.13'

%w[
yt-dlp
litecli
].each do |package|
  execute "pip install #{package}"
end
