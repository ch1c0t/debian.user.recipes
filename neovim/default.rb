HOME = ENV['HOME']

remote_directory "#{HOME}/.config/nvim" do
  source 'config'
end
