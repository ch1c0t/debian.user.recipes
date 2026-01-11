parsers = {
  "c", "lua", "vim", "vimdoc", "query", "elixir"
  "javascript", "typescript", "html", "css"
  "ruby", "python"
}
{
  "nvim-treesitter/nvim-treesitter"
  branch: "master"
  build: ->
    for parser in *parsers
      vim.cmd "TSInstall #{parser}"
    vim.cmd "TSUpdate"
  config: ->
    configs = require "nvim-treesitter.configs"
    configs.setup
      ensure_installed: parsers
      auto_install: true
      sync_install: true
      highlight:
        enable: true
      indent:
        enable: true
      incremental_selection:
        enable: true
        keymaps:
          init_selection: "<Enter>"
          node_incremental: "<Enter>"
          node_decremental: "<Backspace>"
          scope_incremental: false
}
