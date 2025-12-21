local opts = { noremap = true, silent = true }

local mappings = {
  { 'n', '<leader>re', 'editor.action.rename' },

  { 'n', 'w', 'cursorWordPartRight' },
  { 'n', 'b', 'cursorWordPartLeft' },
  { 'v', 'w', 'cursorWordPartRightSelect' },
  { 'v', 'b', 'cursorWordPartLeftSelect' },

  { 'n', '<leader>gy', 'editor.action.goToTypeDefinition' },
  { 'n', '<leader>gi', 'editor.action.goToImplementation' },
  { 'n', '<leader>gr', 'editor.action.goToReferences' },
  { 'n', '<leader>gs', 'workbench.action.gotoSymbol' },

  { 'n', '<leader>nf', 'workbench.action.navigateForward' },
  { 'n', '<leader>nb', 'workbench.action.navigateBack' },
  { 'n', '<leader>je', 'workbench.action.navigateToLastEditLocation' },
}

for _, mapping in ipairs(mappings) do
  local mode, key, command = mapping[1], mapping[2], mapping[3]
  vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
end
