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
