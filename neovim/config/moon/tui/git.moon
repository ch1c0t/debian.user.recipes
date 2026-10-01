vim.keymap.set "n", "<leader>ga", ->
  vim.system { "git", "add", "-A" }, {}, (obj) ->
    vim.schedule ->
      if obj.code == 0
        vim.notify "Git: Staged all changes (-A)", vim.log.levels.INFO

        if package.loaded.neogit
          neogit = require "neogit"
          neogit.dispatch_refresh!
      else
        vim.notify "Git Add Failed: #{obj.stderr or 'Unknown error'}", vim.log.levels.ERROR
