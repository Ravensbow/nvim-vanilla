return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "codecompanion" },
	config = function()
		require('render-markdown').setup({
			completions = { blink = { enabled = true } },
		})
	end
}
