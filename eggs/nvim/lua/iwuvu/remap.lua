local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
keymap("n", "<leader>pv", vim.cmd.Ex)

--Barbar
keymap('n', '<leader>bn', vim.cmd.BufferNext, { desc = 'Open next tab' })
keymap('n', '<leader>bp', vim.cmd.BufferPrevious, { desc = 'Open previous tab' })
keymap('n', '<leader>bc', vim.cmd.BufferClose, { desc = 'Close current tab' })

-- Titles
keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)
-- Named parts
keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)
-- Simple line
keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
-- keymap("i", "<M-l>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode
-- Marked comments
keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)


