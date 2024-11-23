remote_directory "#{HOME}/.vim" do
  source 'rc'
end

include_recipe 'coc'
include_recipe 'helptags'
