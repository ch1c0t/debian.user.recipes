{
  "folke/flash.nvim"
  event: "VeryLazy"
  opts: {}
  keys: {
    {
      "s"
      mode: { "n", "x", "o" }
      -> require("flash").jump!
    }
    {
      "S"
      mode: { "n", "x", "o" }
      -> require("flash").treesitter!
    }
    {
      "r"
      mode: "o"
      -> require("flash").remote!
    }
    {
      "R"
      mode: { "o", "x" }
      -> require("flash").treesitter_search!
    }
    {
      "<c-s>"
      mode: { "c" }
      -> require("flash").toggle!
    }
  }
}
