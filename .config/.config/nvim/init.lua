require("config.lazy")
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.cmd("colorscheme catppuccin")
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>t', ':!alacritty &<CR>', { noremap = true })

vim.api.nvim_create_user_command(
	'Html5',
	function()
		vim.cmd('!html-struct-generator.sh ./' .. vim.fn.expand('%'))
	end,
	{ nargs = 0 }
)

vim.api.nvim_create_user_command(
	'ClearFile',
	function()
		vim.cmd('!echo "" > ./' .. vim.fn.expand('%'))
	end,
	{ nargs = 0 }
)
