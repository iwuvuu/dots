vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
