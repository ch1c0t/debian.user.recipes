export map = (mode, keys) ->
  for key, command in pairs keys do
    vim.keymap.set mode, key, command

augment vim.g,
  mapleader: " "
  maplocalleader: "\\"

vim.cmd 'nmap <leader>s :w<cr>'
vim.keymap.set 'v', '<leader>x', ':lua<cr>'

map 'n',
  "-": "<cmd>Oil<cr>"
  "<A-t>": "<C-^>"
  "<A-cr>": "<cmd>lua print('alt+enter')<cr>"
  "<A-b>b": "ciw`<C-r>\"`<esc>"

map 'i',
  "<A-b>b": "``<esc>i"
