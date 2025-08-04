vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.o.background = "dark" -- or "light" for light mode
-- vim.o.winborder = 'rounded'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- vim.cmd([[colorscheme gruvbox]])

require("config.plugins.lualine")
require("config.plugins.treesitter")
require("config.plugins.mason")

--vim.cmd("set completeopt+=noselect")
require("mini.pairs").setup()
require('Comment').setup()

vim.api.nvim_create_autocmd('TermOpen', {
	desc = 'Settings of nvim build in terminal',
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true, }),
	callback = function ()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
