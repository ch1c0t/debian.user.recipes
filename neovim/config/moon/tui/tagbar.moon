set_tagbar_width = ->
  screen_width = vim.api.nvim_get_option("columns")
  vim.g.tagbar_width = math.floor(screen_width / 2)

set_tagbar_width!

map 'n',
  '<F8>': '<cmd>TagbarToggle<cr>'
