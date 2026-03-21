function is_current_buffer_empty()
  -- 0 refers to the current buffer
  -- 0 and -1 are the start and end lines (from start to end of file)
  -- false means not including the line breaks
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- An empty buffer is represented by a table with a single empty string `{"",}`.
  -- Alternatively, the number of lines is 0 in some edge cases.
  if #lines == 0 or (#lines == 1 and lines[1] == "") then
    return true
  else
    return false
  end
end
