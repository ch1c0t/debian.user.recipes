remotes = {
  "flathub": "https://dl.flathub.org/repo/flathub.flatpakrepo",
}

remotes.each do |name, url|
  execute "flatpak --user remote-add --if-not-exists #{name} #{url}"
end
