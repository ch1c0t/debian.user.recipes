remote_file "#{HOME}/.local/bin/to-left-pane" do
  source 'to-left-pane'
  mode '700'
end

remote_file "#{HOME}/.local/bin/to-lower-pane" do
  source 'to-lower-pane'
  mode '700'
end

remote_file "#{HOME}/.local/bin/to-upper-pane" do
  source 'to-upper-pane'
  mode '700'
end

remote_file "#{HOME}/.local/bin/to-right-pane" do
  source 'to-right-pane'
  mode '700'
end
