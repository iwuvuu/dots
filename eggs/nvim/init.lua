--vim.o.background = "dark"
--vim.cmd("colorscheme everforest")

require("iwuvu")
require("config.lazy")

vim.o.background = "light"
vim.cmd("colorscheme material-lighter")

require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
