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
            "at": "@statement.outer"

            "ai": "@conditional.outer"
            "ii": "@conditional.inner"
            "al": "@loop.outer"
            "il": "@loop.inner"
            "am": "@call.outer"
            "im": "@call.inner"
            "ab": "@block.outer"
            "ib": "@block.inner"
            "aa": "@parameter.outer"
            "ia": "@parameter.inner"
            "a/": "@comment.outer"
            "i/": "@comment.inner"

            "ga=": "@assignment.outer"
            "gi=": "@assignment.inner"
            "gl=": "@assignment.lhs"
            "gr=": "@assignment.rhs"
            "ar": "@return.outer"
            "ir": "@return.inner"
            "az": "@regex.outer"
            "iz": "@regex.inner"
          selection_modes:
            "@function.outer": 'V'
            "@class.outer": '<c-v>'
        move:
          enable: true
          goto_next_start:
            "]f": "@function.outer"
            "]c": "@class.outer"
            "]i": "@conditional.outer"
            "]l": "@loop.outer"
            "]m": "@call.outer"
            "]b": "@block.outer"
            "]a": "@parameter.inner"
            "]/": "@comment.outer"
            "]s": "@statement.outer"
            "]=": "@assignment.outer"
            "]r": "@return.outer"
          goto_next_end:
            "]F": "@function.outer"
            "]C": "@class.outer"
            "]I": "@conditional.outer"
            "]L": "@loop.outer"
            "]M": "@call.outer"
            "]B": "@block.outer"
            "]A": "@parameter.inner"
          goto_previous_start:
            "[f": "@function.outer"
            "[c": "@class.outer"
            "[i": "@conditional.outer"
            "[l": "@loop.outer"
            "[m": "@call.outer"
            "[b": "@block.outer"
            "[a": "@parameter.inner"
            "[/": "@comment.outer"
            "[s": "@statement.outer"
            "[=": "@assignment.outer"
            "[r": "@return.outer"
          goto_previous_end:
            "[F": "@function.outer"
            "[C": "@class.outer"
            "[I": "@conditional.outer"
            "[L": "@loop.outer"
            "[M": "@call.outer"
            "[B": "@block.outer"
            "[A": "@parameter.inner"
}
