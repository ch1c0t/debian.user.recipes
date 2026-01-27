{
  "yarospace/lua-console.nvim"
  lazy: true
  keys: {
    { "<leader>ct", desc: "Lua-console - toggle" }
    { "<leader>ca", desc: "Lua-console - attach to buffer" }
  }
  opts:
    mappings:
      toggle: "<leader>ct"
      attach: "<leader>ca"
}
