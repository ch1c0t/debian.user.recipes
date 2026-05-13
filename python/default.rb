execute '~/.local/bin/mise use -g python@3.14'
execute 'pip uninstall uv'

execute '~/.local/bin/mise use -g uv@0.11'

%w[
pip
"redis[hiredis]"
frida-tools
frida
pynvim
yt-dlp
ffmpeg-normalize
litecli
ptpython
libtmux
tmuxp
].each do |package|
  execute "pip install #{package} --upgrade"
end
