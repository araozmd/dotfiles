return {
	"nvimtools/none-ls.nvim",
	keys = {
		{ "<Leader>gf", vim.lsp.buf.format, mode = { "n", "v" } },
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.diagnostics.semgrep,
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
