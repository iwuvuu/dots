vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Barbar
vim.keymap.set('n', '<leader>bn', vim.cmd.BufferNext, { desc = 'Open next tab' })
vim.keymap.set('n', '<leader>bp', vim.cmd.BufferPrevious, { desc = 'Open previous tab' })
vim.keymap.set('n', '<leader>bc', vim.cmd.BufferClose, { desc = 'Close current tab' })


