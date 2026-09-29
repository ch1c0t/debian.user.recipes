tab_history = {}

push_to_history = (tab_id) ->
  return if not tab_id or not vim.api.nvim_tabpage_is_valid tab_id

  for i, id in ipairs tab_history
    if id == tab_id
      table.remove tab_history, i
      break
  table.insert tab_history, tab_id

scrub_history = ->
  cleaned = {}
  seen = {}
  for id in *tab_history
    if vim.api.nvim_tabpage_is_valid(id) and not seen[id]
      table.insert cleaned, id
      seen[id] = true
  tab_history = cleaned

vim.api.nvim_create_autocmd { "TabLeave", "TabEnter", "TabClosed" },
  callback: (args) ->
    switch args.event
      when "TabLeave"
        push_to_history vim.api.nvim_get_current_tabpage!
      when "TabEnter"
        push_to_history vim.api.nvim_get_current_tabpage!
      when "TabClosed"
        scrub_history!

vim.keymap.set "n", "<leader><Tab>", ->
  scrub_history!

  if #tab_history < 2
    print "No alternative tab to toggle to!"
    return

  current_tab = vim.api.nvim_get_current_tabpage!
  target_tab = nil

  for i = #tab_history, 1, -1
    if tab_history[i] != current_tab
      target_tab = tab_history[i]
      break

  if target_tab and vim.api.nvim_tabpage_is_valid target_tab
    vim.api.nvim_set_current_tabpage target_tab
  else
    print "Previous tab is no longer valid!"
