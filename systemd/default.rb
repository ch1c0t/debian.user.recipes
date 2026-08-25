HOME = ENV['HOME']
SYSTEMD_CONFIG = "#{HOME}/.config/systemd"

remote_directory "#{SYSTEMD_CONFIG}/user" do
  source 'units'
end

execute "systemctl --user daemon-reload"

%w[
tmux.service
lavinmq.service
redis.service
xephyrd.service
].each do |service|
  execute "systemctl --user enable #{service} --now"
  # execute "systemctl --user reload-or-restart #{service}"
end
