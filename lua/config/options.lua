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
		local opts = { noremap = true, silent = true }

	  -- Set buffer-local options for the attached buffer
	  opts.buffer = ev.buf

	  -- LSP Info
	  opts.desc = "Lsp Info"
	  vim.keymap.set('n', '<leader>cl', '<cmd>LspInfo<CR>', opts)

	  -- Goto Declaration
	  opts.desc = "Goto Declaration"
	  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

	  -- Hover (show documentation)
	  opts.desc = "Hover"
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

	  -- Signature Help (Normal mode)
	  opts.desc = "Signature Help"
	  vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)

	  -- Signature Help (Insert mode)
	  opts.desc = "Signature Help"
	  vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, opts)

	  -- Code Action (Normal and Visual modes)
	  opts.desc = "Code Action"
	  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

	  -- Run Codelens
	  opts.desc = "Run Codelens"
	  vim.keymap.set('n', '<leader>cc', vim.lsp.codelens.run, opts)

	  -- Refresh & Display Codelens
	  opts.desc = "Refresh & Display Codelens"
	  vim.keymap.set('n', '<leader>cC', vim.lsp.codelens.refresh, opts)

	  -- Rename File (Placeholder - LSP typically renames symbols)
	  opts.desc = "Rename File (Placeholder)"
	  vim.keymap.set('n', '<leader>cR', function() print("File rename not standard LSP. Use a plugin or custom function.") end, opts)

	  -- Rename Symbol
	  opts.desc = "Rename Symbol"
	  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)

	  -- Source Action
	  opts.desc = "Source Action"
	  vim.keymap.set('n', '<leader>cA', vim.lsp.buf.code_action, opts) -- Often mapped to code_action with specific context

	  -- Next Diagnostic/Reference
	  opts.desc = "Next Diagnostic/Reference"
	  vim.keymap.set('n', ']]', vim.diagnostic.jump, opts)
	  opts.desc = "Next Diagnostic/Reference (Alt+n)"
	  vim.keymap.set('n', '<a-n>', vim.diagnostic.jump, opts)

	  -- Prev Diagnostic/Reference
	  opts.desc = "Prev Diagnostic/Reference"
	  vim.keymap.set('n', '[[' , function() vim.diagnostic.jump({count = -1}) end, opts)
	  opts.desc = "Prev Diagnostic/Reference (Alt+p)"
	  vim.keymap.set('n', '<a-p>', function() vim.diagnostic.jump({count = -1}) end, opts)

	  -- Optional: Add formatting on save if the client supports it
	  if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
		  buffer = bufnr,
		  callback = function()
			vim.lsp.buf.format({ async = true })
		  end,
		  desc = "Format on Save",
		})
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
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "javascript", "typescript", "c", "rust", "c_sharp", "razor", "html", "lua", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
--vim.lsp.enable({'roslyn'})
--vim.lsp.enable({'omnisharp'})
--vim.lsp.enable({'csharp_ls'})
