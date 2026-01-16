HOME = ENV['HOME']
SAKURA_CONFIG = "#{HOME}/.config/sakura"

directory SAKURA_CONFIG
remote_file "#{SAKURA_CONFIG}/sakura.conf" do
  source 'sakura.conf'
end
