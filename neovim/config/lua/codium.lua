local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>re', function() vim.fn.VSCodeNotify('editor.action.rename') end, opts)
