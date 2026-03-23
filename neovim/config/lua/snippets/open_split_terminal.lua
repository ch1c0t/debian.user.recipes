-- Function to open the same terminal in two vertical splits
local function open_split_terminal()
  -- 1. Create a terminal buffer in the current window
  vim.cmd('terminal')
  local term_buf = vim.api.nvim_get_current_buf()
  
  -- Enter insert mode
  vim.cmd('startinsert')

  -- 2. Create a vertical split
  vim.cmd('vsplit')

  -- 3. Set the new window to use the same terminal buffer
  vim.api.nvim_set_current_buf(term_buf)
end

-- Example usage:
-- Map to a key
vim.keymap.set('n', '<leader>st', open_split_terminal, { desc = 'Split Terminal' })
