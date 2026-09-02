%w[
pip
"redis[hiredis]"
frida-tools
frida
pynvim
yt-dlp
ffmpeg-normalize
litecli
bpython
libtmux
tmuxp
].each do |package|
  execute "pip install #{package} --upgrade"
end
