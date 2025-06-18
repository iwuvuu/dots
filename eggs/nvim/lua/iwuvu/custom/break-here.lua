vim.api.nvim_exec([[
	function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
	endfunction
]], false)

vim.api.nvim_set_keymap('n', '<leader>lb', ':<C-u>call BreakHere()<CR>', { noremap = true, silent = true })
