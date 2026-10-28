-- 1. CHOOSE GLOBAL DEFINITIONS FIRST
_G.yank_line_range = (start_line, end_line, first_line = nil, last_line = nil) ->
  lines = vim.api.nvim_buf_get_lines 0, start_line - 1, end_line, false
  
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


-- 2. REUSABLE CONFIGURATION OPTIONS
operator_opts = { expr: true, silent: true, desc: "Yank motion or current line to X11" }
buffer_opts   = { silent: true, desc: "Yank entire buffer to X11" }


-- 3. NATIVE OPERATORS FOR MOTIONS
_G.yank_wrapped_operator = (motion_type) ->
  start_line = vim.fn.line "'["
  end_line = vim.fn.line "']"
  _G.yank_line_range start_line, end_line, '```', '```'

_G.yank_raw_operator = (motion_type) ->
  start_line = vim.fn.line "'["
  end_line = vim.fn.line "']"
  _G.yank_line_range start_line, end_line


-- 4. SCHEDULER & RANGE CALCULATORS
get_operator_keys = (operator_name, is_wrapped) ->
  if vim.v.count > 0
    start_l = vim.fn.line "."
    end_l = start_l + vim.v.count - 1
    if is_wrapped
      _G.yank_line_range start_l, end_l, '```', '```'
    else
      _G.yank_line_range start_l, end_l
    return ""

  vim.o.operatorfunc = "v:lua.#{operator_name}"
  
  status, key = pcall vim.fn.getcharstr, { timeout: vim.o.timeoutlen }
  if status and key != ""
    return "g@" .. key
  else
    start_l = vim.fn.line "."
    if is_wrapped
      _G.yank_line_range start_l, start_l, '```', '```'
    else
      _G.yank_line_range start_l, start_l
    return ""


-- 5. NAMED MAPPING FUNCTIONS
handle_wrapped_yank = ->
  return get_operator_keys "yank_wrapped_operator", true

handle_raw_yank = ->
  return get_operator_keys "yank_raw_operator", false


-- 6. KEYMAP SETUPS
vim.keymap.set 'n', '<leader>yb', handle_wrapped_yank, operator_opts
vim.keymap.set 'n', '<leader>yx', handle_raw_yank, operator_opts

vim.keymap.set 'n', '<leader>yB', ':<C-u>lua _G.yank_line_range(1, vim.api.nvim_buf_line_count(0), "```", "```")<CR>', buffer_opts
vim.keymap.set 'n', '<leader>yX', ':<C-u>lua _G.yank_line_range(1, vim.api.nvim_buf_line_count(0))<CR>', buffer_opts
