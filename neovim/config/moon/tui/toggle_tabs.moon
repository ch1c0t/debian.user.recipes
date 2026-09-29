tab_history = {}

remove_from_history = (tab_id) ->
  for i, id in ipairs tab_history
    if id == tab_id
      table.remove tab_history, i
      break

vim.api.nvim_create_autocmd { "TabEnter", "TabLeave", "TabClosed" }, {
  callback: (args) ->
    current_tab = vim.api.nvim_get_current_tabpage!

    if args.event == "TabClosed"
      closed_tab = tonumber args.file
      remove_from_history closed_tab if closed_tab
    else
      remove_from_history current_tab
      table.insert tab_history, current_tab
}

vim.keymap.set "n", "<leader><Tab>", ->
  if #tab_history < 2
    print "No alternative tab to toggle to!"
    return

  target_tab = tab_history[#tab_history - 1]

  if target_tab and vim.api.nvim_tabpage_is_valid target_tab
    vim.api.nvim_set_current_tabpage target_tab
  else
    print "Previous tab is no longer valid!"
