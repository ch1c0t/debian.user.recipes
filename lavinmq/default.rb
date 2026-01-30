HOME = ENV['HOME']

LAVIN_CONFIG = "#{HOME}/.config/lavinmq"
LAVIN_SHARE = "#{HOME}/.local/share/lavinmq"
LAVIN_DATA = "#{LAVIN_SHARE}/data"

directory LAVIN_CONFIG
directory LAVIN_SHARE
directory LAVIN_DATA

file "#{LAVIN_CONFIG}/lavinmq.ini" do
  content <<~S
    [main]
    data_dir = #{LAVIN_DATA}

    [mgmt]
    unix_path = #{LAVIN_SHARE}/mgmt.sock

    [amqp]
    unix_path = #{LAVIN_SHARE}/amqp.sock

    [clustering]
    enabled = false
  S
end
