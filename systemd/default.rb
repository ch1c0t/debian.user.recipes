HOME = ENV['HOME']
SYSTEMD_CONFIG = "#{HOME}/.config/systemd"

remote_directory "#{SYSTEMD_CONFIG}/user" do
  source 'units'
end

%w[
tmux.service
].each do |service|
  execute "systemctl --user enable #{service}"
end
