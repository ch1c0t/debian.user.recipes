{
  "NeogitOrg/neogit"
  lazy: true
  dependencies: {
    "sindrets/diffview.nvim"
    "ibhagwan/fzf-lua"
  }
  cmd: "Neogit"
  keys: {
    { "<leader>gg", "<cmd>Neogit<cr>", desc: "Show Neogit UI" }
  }
}
