{
  "sindrets/diffview.nvim"
  cmd: { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" }
  opts: {
    keymaps: {
      view: {
        { "n", "q", "<cmd>DiffviewClose<cr>", desc: "Close Diffview tab" }
      }
      file_panel: {
        { "n", "q", "<cmd>DiffviewClose<cr>", desc: "Close Diffview tab" }
      }
      file_history_panel: {
        { "n", "q", "<cmd>DiffviewClose<cr>", desc: "Close Diffview tab" }
      }
    }
  }
}
