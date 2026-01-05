lazypath = "~/.local/share/nvim/lazy/lazy.nvim"
vim.opt.rtp\prepend lazypath
require("lazy").setup("plugins")
