vim.keymap.set "n", "<leader>ga", ->
  vim.system { "git", "add", "-A" }, {}, (obj) ->
    vim.schedule ->
      if obj.code == 0
        vim.notify "Git: Staged all changes (-A)", vim.log.levels.INFO

        -- Check if Neogit is loaded and refresh it
        has_neogit, neogit = pcall require, "neogit"
        if has_neogit
          neogit.refresh!
      else
        vim.notify "Git Add Failed: #{obj.stderr or 'Unknown error'}", vim.log.levels.ERROR
