HOME = ENV['HOME']

REDIS_CONFIG = "#{HOME}/.config/redis"
REDIS_SHARE = "#{HOME}/.local/share/redis"
REDIS_DATA = "#{REDIS_SHARE}/data"

directory REDIS_CONFIG
directory REDIS_DATA

file "#{REDIS_CONFIG}/redis.conf" do
  content <<~S
    port 0
    unixsocket #{REDIS_SHARE}/redis.sock
    unixsocketperm 770
    dir #{REDIS_DATA}
  S
end
