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
vim.o.winborder = 'rounded'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.cmd([[colorscheme gruvbox]])
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")
require("roslyn").setup({
    config = {
        cmd = {
            "dotnet",
            "/home/walko/.local/share/roslyn-ls/Microsoft.CodeAnalysis.LanguageServer.dll",
            "--logLevel=Information",
            "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
            "--stdio",
        },
    },
})
--vim.lsp.enable({'roslyn'})
--vim.lsp.enable({'omnisharp'})
--vim.lsp.enable({'csharp_ls'})
