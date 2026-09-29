update_log_preview = ->
  line = vim.api.nvim_get_current_line!
  commit_hash = line\match "[0-9a-f]{7,40}"
  return if not commit_hash

  target_win = nil
  for win in *vim.api.nvim_list_wins!
    buf = vim.api.nvim_win_get_buf win
    if vim.bo[buf].filetype == "NeogitCommitView"
      target_win = win
      break

  if target_win
    vim.api.nvim_win_call target_win, ->
      vim.cmd "silent! Neogit commit #{commit_hash}"
  else
    current_win = vim.api.nvim_get_current_win!
    vim.cmd "silent! Neogit commit #{commit_hash}"
    vim.api.nvim_set_current_win current_win

move_one_commit_down = ->
  vim.cmd "normal! j"
  update_log_preview!
move_one_commit_up = ->
  vim.cmd "normal! k"
  update_log_preview!

vim.api.nvim_create_autocmd "BufEnter",
  pattern: "*"
  callback: ->
    if vim.bo.filetype == "NeogitLogView"
      options = { buffer: true, silent: true, remap: false }
      vim.keymap.set "n", "j", move_one_commit_down, options
      vim.keymap.set "n", "k", move_one_commit_up, options
