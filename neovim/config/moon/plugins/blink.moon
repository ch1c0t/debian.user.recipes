{
  "saghen/blink.cmp"
  version: "1.*"
  dependencies: {
    "rafamadriz/friendly-snippets"
  }
  cond: -> not vim.g.vscode
  opts:
    keymap:
      preset: 'super-tab'
    sources:
      default: {
        'buffer'
        'path'
        'snippets'
      }
    fuzzy:
      implementation: 'rust'
}
