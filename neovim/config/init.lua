vim.opt.number = true
vim.opt.relativenumber = true

require('keymaps')

if vim.g.vscode then
  require('codium')
end
