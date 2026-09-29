augment vim.opt,
  showtabline: 0

map 'n',
  '<tab>a': '<cmd>tabnext #<cr>'

  '<tab>c': '<cmd>tabnew<cr>'
  '<leader>tc': '<cmd>tabnew<cr>'

  '<tab>x': '<cmd>tabclose<cr>'
  '<leader>tx': '<cmd>tabclose<cr>'

-- Keep track of the last tab page ID
last_tab = nil

vim.api.nvim_create_autocmd "TabLeave", {
  callback: -> last_tab = vim.api.nvim_get_current_tabpage!
}

-- Toggle between current and previous tab
vim.keymap.set "n", "<leader><Tab>", ->
  if last_tab and vim.api.nvim_tabpage_is_valid last_tab
    current = vim.api.nvim_get_current_tabpage!
    vim.api.nvim_set_current_tabpage last_tab
    last_tab = current
  else
    print "No previous tab to toggle to!"
