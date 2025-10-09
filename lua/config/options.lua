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

-- Create a dedicated augroup to avoid duplicate autocommands
local dotnet_augroup = vim.api.nvim_create_augroup('DotnetLSP', { clear = true })

-- Autocommand to run 'dotnet restore' on saving a .csproj file
vim.api.nvim_create_autocmd('BufWritePost', {
  group = dotnet_augroup,
  pattern = '*.csproj', -- Trigger for all .csproj files
  callback = function()
    -- We use a job to run it asynchronously in the background
    vim.fn.jobstart('dotnet restore', {
      on_exit = function(_, code)
        if code == 0 then
          -- Success! Notify the user.
          vim.notify('dotnet restore completed successfully!', vim.log.levels.INFO, { title = 'Dotnet' })
          -- You can also ask the LSP to update for the buffer if needed
          -- vim.lsp.buf.request(0, 'workspace/executeCommand', { command = 'o#/o.reloadProject', arguments = {vim.api.nvim_buf_get_name(0)} })
        else
          -- Failure! Show an error message.
          vim.notify('dotnet restore failed!', vim.log.levels.ERROR, { title = 'Dotnet' })
        end
      end,
    })
  end,
  desc = 'Run dotnet restore after saving a .csproj file.',
})
