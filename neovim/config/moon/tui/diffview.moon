fzf = require "fzf-lua"

map "n",
  "<leader>gd": ":DiffviewOpen<cr>"
  "<leader>gx": ":DiffviewClose<cr>"
  "<leader>gh": ":DiffviewFileHistory %<cr>"

vim.keymap.set "n", "<leader>gb", ->
  fzf.git_branches
    prompt: "Inspect Branch Commits ❯ "
    actions:
      "default": (selected) ->
        return if not selected or #selected == 0

        selection = selected[1]
        -- Clean up branch name formatting/remotes
        branch = selection\match "[^*%s]+"
        return if not branch

        -- Close open views and open Diffview scoped to that branch
        vim.cmd "DiffviewClose"
        vim.cmd "DiffviewFileHistory --range=#{branch}"
