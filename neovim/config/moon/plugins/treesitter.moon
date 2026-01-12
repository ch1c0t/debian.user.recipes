parsers = {
  "c", "lua", "vim", "vimdoc", "query", "elixir"
  "javascript", "typescript", "html", "css"
  "ruby", "python"
}
{
  "nvim-treesitter/nvim-treesitter"
  branch: "master"
  dependencies: {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch: "master" }
  }
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
      textobjects:
        select:
          enable: true
          lookahead: true
          keymaps:
            "af": "@function.outer"
            "if": "@function.inner"
            "ac": "@class.outer"
            "ic": "@class.inner"
            "as":
              query: "@local.scope"
              query_group: "locals"
          selection_modes:
            "@function.outer": 'V'
            "@class.outer": '<c-v>'
}
