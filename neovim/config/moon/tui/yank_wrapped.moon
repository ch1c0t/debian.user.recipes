yank_wrapped = (first_line = '```', last_line = '```') ->
  -- Get current cursor line number
  start_line = vim.fn.line "."
  
  -- Check if a count prefix was passed (e.g., 7<leader>yB), default to 1 line
  count = vim.v.count
  if count == 0 then count = 1
  
  end_line = start_line + count - 1
  
  -- Grab the range of lines from the buffer (0-indexed API)
  lines = vim.api.nvim_buf_get_lines 0, start_line - 1, end_line, false
  
  -- Insert the custom header and footer
  table.insert lines, 1, first_line
  table.insert lines, last_line
  
  -- Join lines and copy to X11 registers
  text_to_copy = table.concat lines, "\n"
  vim.fn.setreg '+', text_to_copy
  vim.fn.setreg '*', text_to_copy
  
  print "Wrapped #{count} line(s) yanked to X11 clipboard!"

-- Bind to Normal mode ('n')
vim.keymap.set 'n', '<leader>yB', (-> yank_wrapped!), { desc: "Yank N lines wrapped to X11" }
