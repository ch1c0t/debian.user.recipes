include_recipe "../../helpers/links_in"

HOME = ENV['HOME']

links_in "#{HOME}/.local/bin" do
  to_each_file_in "#{File.dirname(__FILE__)}/scripts"
end
