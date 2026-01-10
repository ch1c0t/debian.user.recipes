{
  {
    "rockyzhang24/arctic.nvim"
    name: 'arctic'
    dependencies: {
      "rktjmp/lush.nvim"
    }
    branch: 'main'
    -- https://github.com/rockyzhang24/arctic.nvim/issues/15#issuecomment-2676383059
  }
  {
    "webhooked/kanso.nvim"
    lazy: false
    priority: 1000
    config: ->
      vim.cmd 'colorscheme kanso'
  }
}
