return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup{
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				git_files = {
					theme = "dropdown",
				},
				lsp_definitions = {
					initial_mode = "normal",
				},
				lsp_references = {
					initial_mode = "normal",
				}
			},
		}
	end
}
