-- Line numbers
vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = false

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.scrolloff = 10

--vim.o.colorcolumn = "80"

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
		pattern = {"*.hl", "hypr*.conf"},
		callback = function(event)
				print(string.format("starting hyprls for %s", vim.inspect(event)))
				vim.lsp.start {
						name = "hyprlang",
						cmd = {"hyprls"},
						root_dir = vim.fn.getcwd(),
				}
		end
})
