 return {
 	'SmiteshP/nvim-navic',
 	dependencies = { 'neovim/nvim-lspconfig' },
 	config = function()
 		local navic = require("nvim-navic")
 		navic.setup({
 			icons = {
 				File = "󰈙 ",
 				Module = " ",
 				Namespace = "󰌗 ",
 				Package = " ",
 				Class = "󰌗 ",
 				Method = "󰆧 ",
 				Property = " ",
 				Field = " ",
 				Constructor = "󰆧 ",
 				Enum = "󰕘",
 				Interface = "󰕘",
 				Function = "󰊕 ",
 				Variable = "󰆧 ",
 				Constant = "󰏿 ",
 				String = "󰀬 ",
 				Number = "󰎠 ",
 				Boolean = "Ⓕ ",
 				Array = "󰅪 ",
 				Object = "󰅩 ",
 				Key = "󰌋 ",
 				Null = "󰟢 ",
 				EnumMember = " ",
 				Struct = "󰌗 ",
 				Event = " ",
 				Operator = "󰆕 ",
 				TypeParameter = "󰊄 ",
 			},
 			highlight = false,
 			separator = " > ",
 			depth_limit = 0,
 			depth_limit_indicator = "..",
 			safe_output = true,
 			lazy_update_context = false,
 			click = false,
 		})
 		vim.api.nvim_create_autocmd("LspAttach", {
 			callback = function(args)
 				local client = vim.lsp.get_client_by_id(args.data.client_id)
 				if client.server_capabilities.documentSymbolProvider then
 					navic.attach(client, args.buf)
 				end
 			end,
 		})
 		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
 	end,
 }
