require('common')

if vim.g.vscode then
  require('codium')
else
  require('tui')
end
