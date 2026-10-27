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

-- Options table extracted to a reusable variable
map_opts = { expr: true, silent: true, desc: "Yank motion or current line to X11" }

-- --- OPERATORS ---

-- Wrapped operator
_G.yank_wrapped_operator = (motion_type) ->
  start_line = vim.fn.line "'["
  end_line = vim.fn.line "']"
  _G.yank_line_range start_line, end_line, '```', '```'

-- Raw operator
_G.yank_raw_operator = (motion_type) ->
  start_line = vim.fn.line "'["
  end_line = vim.fn.line "']"
  _G.yank_line_range start_line, end_line


-- --- NAMED MAPPING FUNCTIONS ---

-- Dynamic wrapper handler
handle_wrapped_yank = ->
  vim.o.operatorfunc = "v:lua.yank_wrapped_operator"
  if vim.v.count > 0
    return "g@_"
  else
    vim.schedule ->
      if vim.v.operator == 'g@' then vim.fn.feedkeys "_", "n"
    return "g@"

-- Dynamic raw handler
handle_raw_yank = ->
  vim.o.operatorfunc = "v:lua.yank_raw_operator"
  if vim.v.count > 0
    return "g@_"
  else
    vim.schedule ->
      if vim.v.operator == 'g@' then vim.fn.feedkeys "_", "n"
    return "g@"

-- --- KEYMAPS ---

-- [WRAPPED] <leader>yb (motion, count, or standalone current line)
vim.keymap.set 'n', '<leader>yb', handle_wrapped_yank, map_opts

-- [RAW] <leader>yx (motion, count, or standalone current line)
vim.keymap.set 'n', '<leader>yx', handle_raw_yank, map_opts

-- Buffer-wide shortcuts remain dedicated actions
vim.keymap.set 'n', '<leader>yB', ':<C-u>lua _G.yank_line_range(1, vim.api.nvim_buf_line_count(0), "```", "```")<CR>', { silent: true, desc: "Yank entire buffer wrapped" }
vim.keymap.set 'n', '<leader>yX', ':<C-u>lua _G.yank_line_range(1, vim.api.nvim_buf_line_count(0))<CR>', { silent: true, desc: "Yank entire buffer raw" }
