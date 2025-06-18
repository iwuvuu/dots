--vim.o.background = "dark"
--vim.cmd("colorscheme everforest")

require("iwuvu")
require("config.lazy")

vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
