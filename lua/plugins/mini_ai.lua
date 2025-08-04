return {
	'echasnovski/mini.ai',
	version = false,
	opts = function ()
		local ai = require("mini.ai")
		return {
			n_lines = 500,
			custom_textobjects = {
				F = ai.gen_spec.treesitter({ a = { "@function.outer", "@method.outer" }, i = { "@function.inner", "@method.inner" }}),
				c = ai.gen_spec.treesitter({ a= "@class.outer", i  = "@class.inner"}),
				d = { "%f[%d]%d+"},
				e = { -- Word with case
					{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
					"^().*()$",
				},
			}
		}
	end,
	config = function (_, opts)
		require('mini.ai').setup(opts);
	end,
}
