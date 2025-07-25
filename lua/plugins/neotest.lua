return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nsidorenco/neotest-vstest"
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vstest")
			}
		})
	end
}
