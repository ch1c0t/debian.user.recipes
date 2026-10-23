-- Global function to fetch line ranges and yank directly to X11 registers (+ and *)
_G.yank_line_range = (start_line, end_line, first_line = nil, last_line = nil) ->
  lines = vim.api.nvim_buf_get_lines 0, start_line - 1, end_line, false
  
  -- Only wrap if strings are explicitly passed for first/last lines
  if first_line and last_line
    table.insert lines, 1, first_line
    table.insert lines, last_line
  
  text_to_copy = table.concat lines, "\n"
  vim.fn.setreg '+', text_to_copy
  vim.fn.setreg '*', text_to_copy
  
  if first_line
    print "Wrapped text yanked to X11 clipboard!"
  else
    print "Raw text yanked to X11 clipboard!"

-- Operator function called natively by the motion engine
_G.yank_wrapped_operator = (motion_type) ->
  start_line = vim.fn.line "'["
  end_line = vim.fn.line "']"
  _G.yank_line_range start_line, end_line, '```', '```'


-- --- KEYMAPS ---

-- [WRAPPED] <leader>yb + motion (e.g., <leader>ybip, <leader>ybG) or 7<leader>yb
vim.keymap.set 'n', '<leader>yb', ->
  vim.o.operatorfunc = "v:lua.yank_wrapped_operator"
  if vim.v.count > 0
    vim.fn.feedkeys "#{vim.v.count}g@_", "m"
  else
    vim.fn.feedkeys "g@", "m"

-- [WRAPPED] <leader>y. -> Wraps and yanks the current line(s)
vim.keymap.set 'n', '<leader>y.', ':<C-u>lua _G.yank_line_range(vim.fn.line("."), vim.fn.line(".") + vim.v.count1 - 1, "```", "```")<CR>', { silent: true, desc: "Yank current line(s) wrapped" }

-- [WRAPPED] <leader>yB -> Wraps and yanks the entire buffer
vim.keymap.set 'n', '<leader>yB', ':<C-u>lua _G.yank_line_range(1, vim.api.nvim_buf_line_count(0), "```", "```")<CR>', { silent: true, desc: "Yank entire buffer wrapped" }


-- --- NEW UNWRAPPED SHORTCUTS ---

-- [RAW] <leader>yx -> Yanks the current line or a specific number of lines (e.g. 5<leader>yx)
vim.keymap.set 'n', '<leader>yx', ':<C-u>lua _G.yank_line_range(vim.fn.line("."), vim.fn.line(".") + vim.v.count1 - 1)<CR>', { silent: true, desc: "Yank current line(s) raw to X11" }

-- [RAW] <leader>yX -> Yanks the entire buffer to X11 completely raw
vim.keymap.set 'n', '<leader>yX', ':<C-u>lua _G.yank_line_range(1, vim.api.nvim_buf_line_count(0))<CR>', { silent: true, desc: "Yank entire buffer raw to X11" }
