vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		--	if client:supports_method('textDocument/completion') then
		--		vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		--	end
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
		vim.keymap.set('n', ']]', function() vim.diagnostic.jump({count = 1}) end, opts)
		opts.desc = "Next Diagnostic/Reference (Alt+n)"
		vim.keymap.set('n', '<a-n>', vim.diagnostic.jump, opts)

		-- Prev Diagnostic/Reference
		opts.desc = "Prev Diagnostic/Reference"
		vim.keymap.set('n', '[[' , function() vim.diagnostic.jump({count = -1}) end, opts)
		opts.desc = "Prev Diagnostic/Reference (Alt+p)"
		vim.keymap.set('n', '<a-p>', function() vim.diagnostic.jump({count = -1}) end, opts)

		-- Optional: Add formatting on save if the client supports it
		--if client.supports_method("textDocument/formatting") then
		--	vim.api.nvim_create_autocmd("BufWritePre", {
		--		buffer = bufnr,
		--		callback = function()
		--			vim.lsp.buf.format({ async = true })
		--		end,
		--		desc = "Format on Save",
		--	})
		--end
	end,
})

-- Restart LSP when saving a new .cs file to pick up new files in .NET projects
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.cs",
	callback = function()
		vim.cmd("LspRestart")
	end,
})
