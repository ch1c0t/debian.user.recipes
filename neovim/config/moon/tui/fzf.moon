export fzf = require 'fzf-lua'

map 'n',
  "<C-p>": "<cmd>FzfLua files<cr>"
  "<A-e>f": "<cmd>FzfLua files<cr>"
  "<leader>fg": fzf.live_grep
  "<leader>fb": fzf.buffers
  "<leader>fo": fzf.oldfiles
  "<leader>fc": fzf.commands
  "<leader>fh": fzf.command_history
  "<leader>ft": fzf.helptags
  "<leader>fm": fzf.manpages
