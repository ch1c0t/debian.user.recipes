local opts = { noremap = true, silent = true }

local mappings = {
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

  { 'n', '<leader>ss', 'workbench.action.showAllSymbols' },
  { 'n', '<leader>sa', 'workbench.action.showCommands' },
  { 'n', '<leader>sf', 'workbench.action.quickOpen' },

  { 'n', '<leader>vd', 'editor.action.peekDefinition' },
  { 'n', '<leader>vi', 'editor.action.peekImplementation' },
  { 'n', '<leader>vt', 'editor.action.peekTypeDefinition' },
  { 'n', '<leader>vh', 'editor.action.showHover' },

  { 'n', '<leader>fr', 'references-view.findReferences' },
  { 'n', '<leader>sr', 'editor.action.referenceSearch.trigger' },

  { 'n', '<leader>ff', 'actions.find' },
  { 'n', '<leader>fr', 'editor.action.startFindReplaceAction' },
  { 'n', '<leader>fg', 'workbench.action.findInFiles' },
  { 'n', '<leader>rg', 'workbench.action.replaceInFiles' },
  { 'n', '<leader>re', 'editor.action.rename' },
  { 'n', '<leader>rf', 'editor.action.refactor' },
  { 'n', '<leader>qf', 'editor.action.quickFix' },
  { 'n', '<leader>sg', 'editor.action.triggerSuggest' },

  { 'n', '<leader>fm', 'editor.action.formatDocument' },
  { 'n', '<leader>oi', 'editor.action.organizeImports' },
}

for _, mapping in ipairs(mappings) do
  local mode, key, command = mapping[1], mapping[2], mapping[3]
  vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
end
