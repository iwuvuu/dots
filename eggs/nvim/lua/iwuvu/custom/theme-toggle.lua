-- Define themes
local themes = {
	everforest_light = { name = "everforest", background = "light" },
	everforest_dark = { name = "everforest", background = "dark" },
	material_lighter = { name = "material-lighter", background = "light" },
	material_deep_ocean = { name = "material-deep-ocean", background = "dark" },
	gruvbox_light = { name = "gruvbox", background = "light" },
	gruvbox_dark = { name = "gruvbox", background = "dark" },
}

-- Create custom user command

vim.api.nvim_create_user_command("Theme",
	function(opts)
		local key = opts.args
		local theme = themes[key]

		if theme then
			vim.o.background = theme.background
			vim.cmd("colorscheme " .. theme.name)

			print("Current colorscheme is " .. theme.name)
		else
			print("Invalid theme: " .. key)
		end 
	end, {
		nargs = 1,
		complete = function()
			return vim.tbl_keys(themes)
		end,
	}
)
