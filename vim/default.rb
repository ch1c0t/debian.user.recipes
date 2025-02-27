HOME = ENV['HOME']

remote_directory "#{HOME}/.vim" do
  source 'rc'
end

include_recipe 'helptags'
