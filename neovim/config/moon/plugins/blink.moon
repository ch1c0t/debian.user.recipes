{
  "saghen/blink.cmp"
  version: "1.*"
  dependencies: {
    "rafamadriz/friendly-snippets"
    "nvim-mini/mini.snippets"
  }
  cond: -> not vim.g.vscode
  opts:
    keymap:
      preset: 'super-tab'
    snippets:
      preset: 'mini_snippets'
    sources:
      default: {
        'buffer'
        'path'
        'snippets'
      }
    fuzzy:
      implementation: 'rust'
}
