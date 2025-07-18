HOME = ENV['HOME']
SYSTEMD_CONFIG = "#{HOME}/.config/systemd"

remote_directory "#{SYSTEMD_CONFIG}/user" do
  source 'units'
end

execute 'systemctl --user enable tmux.service'
