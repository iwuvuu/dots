 return {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
			 filetypes = { "*" },
			 user_default_options = {
				 names = false,
				 mode = "background",
				 css = true,
				 css_fn = true,
				 tailwind = true,
			 },
		 })
--[[
      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
--]]
    end,
  }

