HOME = ENV['HOME']

directory "#{HOME}/.config/gtk-3.0"

remote_file "#{HOME}/.config/gtk-3.0/settings.ini" do
  source 'config/settings.ini'
end
