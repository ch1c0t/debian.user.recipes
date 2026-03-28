%w[
marimo
].each do |package|
  execute "pip install '#{package}[recommended]' --upgrade"
end
