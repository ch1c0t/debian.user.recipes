map 'i',
  "jk": "<esc>"

map 'n',
  "<C-p>": "<cmd>FzfLua files<cr>"
  "<leader>fg": "<cmd>lua require('fzf-lua').live_grep()<CR>"
  "<leader>fb": "<cmd>lua require('fzf-lua').buffers()<CR>"
  "<leader>fh": "<cmd>lua require('fzf-lua').oldfiles()<CR>"
