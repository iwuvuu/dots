
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-Up>", "<cmd>:GUIFontSizeUp<CR>", opts)
vim.keymap.set("n", "<A-Down>", "<cmd>:GUIFontSizeDown<CR>", opts)
vim.keymap.set("n", "<A-0>", "<cmd>:GUIFontSizeSet<CR>", opts)

return{
    "ktunprasert/gui-font-resize.nvim",
    config = true,
}
