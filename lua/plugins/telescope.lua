return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim' },
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
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = {"png", "webp", "jpg", "jpeg"},
					-- find command (defaults to `fd`)
					find_cmd = "rg"
				}
			},
		}
	end
}
