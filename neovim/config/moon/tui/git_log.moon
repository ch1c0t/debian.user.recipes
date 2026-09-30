vim.keymap.set "n", "<leader>gl", ->
  has_neogit, neogit = pcall require, "neogit"
  if has_neogit
    neogit.action("log", "log_current")!
  else
    vim.notify "Neogit plugin not found!", vim.log.levels.ERROR
