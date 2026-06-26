HOME = ENV['HOME']

LAVIN_CONFIG = "#{HOME}/.config/lavinmq"
LAVIN_SHARE = "#{HOME}/.local/share/lavinmq"
LAVIN_DATA = "#{LAVIN_SHARE}/data"

directory LAVIN_CONFIG
directory LAVIN_DATA

file "#{LAVIN_CONFIG}/lavinmq.ini" do
  content <<~S
    [main]
    data_dir = #{LAVIN_DATA}
    metrics_http_port = -1

    [mgmt]
    port = -1

    [amqp]
    unix_path = #{LAVIN_SHARE}/amqp.sock
    port = -1

    [mqtt]
    port = -1

    [clustering]
    enabled = false
  S
end
