-- Automatically check for file changes
vim.o.autoread = true

-- Trigger checktime on various events for immediate updates
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- Sets updatetime to 250 milliseconds
vim.opt.updatetime = 250

-- Automatically reload files when they change outside Neovim
-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
--   callback = function()
--     if vim.fn.mode() ~= 'c' then
--       vim.cmd('checktime')
--     end
--   end,
-- })
