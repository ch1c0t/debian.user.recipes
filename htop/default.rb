HOME = ENV['HOME']

directory "#{HOME}/.config/htop"

remote_file "#{HOME}/.config/htop/htoprc" do
  source 'htoprc'
end
