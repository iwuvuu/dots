return {
	{
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	};
	{
    'ray-x/aurora',
	lazy = false,
	priority = 1000,
    init = function()
		vim.g.aurora_italic = 1
		vim.g.aurora_transparent = 1
		vim.g.aurora_bold = 1
    end,
	};
	{
	'marko-cerovac/material.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require("material").setup({
				contrast = {
					sidebars = true,
					floating_windows = true,
				},	
				plugins = {
					"nvim-cmp",
					"nvim-tree",
					"telescope",
					"which-key",
				},
				lualine_style = "stealth",
			})
	end
	}
}

