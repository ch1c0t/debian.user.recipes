-- Define a function to close the current tab
function close_current_tab()
  -- Check if there is more than one tab open before attempting :tabclose
  if vim.fn.tabpagenr("$") > 1 then
    vim.cmd("tabclose")
  else
    -- If it's the last tab, save(if modified) and quit
    vim.cmd("x")
  end
end
