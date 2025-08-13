vim.g.mapleader = " "

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)
vim.keymap.set('n', '<leader>lz', ':Lazy<CR>')
vim.keymap.set('n', '<leader>pv', function() vim.lsp.buf.format() end)

vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('v', ';', ':', { noremap = true })

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
