HOME = ENV['HOME']

directory "#{HOME}/sources/ruby"

remote_directory "#{HOME}/sources/ruby/clipboard_service" do
  source 'sources/clipboard_service'
end

remote_directory "#{HOME}/sources/ruby/to-clipboard" do
  source 'sources/to-clipboard'
end

directory "#{HOME}/.local/bin"
link "#{HOME}/.local/bin/to-clipboard" do
  to "#{HOME}/sources/ruby/to-clipboard/bin/to-clipboard"
end
