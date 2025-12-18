HOME = ENV['HOME']

remote_file "#{HOME}/.config/VSCodium/User/settings.json" do
  source 'settings.json'
end
