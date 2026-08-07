HOME = ENV['HOME']
SSH = "#{HOME}/.ssh"

directory SSH
file "#{SSH}/config" do
  content <<~S
  Include config.d/*
  S
end

SSH_CONFIGS = "#{SSH}/config.d"
directory SSH_CONFIGS
