%w[
yt-dlp
litecli
].each do |package|
  execute "pipx install #{package}"
end
