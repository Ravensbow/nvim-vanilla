return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
	  -- transparent=true
  },
  config = function()
	  require("tokyonight").setup({
		  -- transparent=true
	  })
	  vim.cmd("colorscheme tokyonight-moon")
  end
}
