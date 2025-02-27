HOME = ENV['HOME']

directory "#{HOME}/.config/git"

remote_file "#{HOME}/.config/git/config" do
  source 'gitconfig'
end

remote_file "#{HOME}/.config/git/global_gitignore" do
  source 'global_gitignore'
end
