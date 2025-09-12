return {
	"nvimtools/none-ls.nvim",
	keys = {
		{ "<Leader>gf", vim.lsp.buf.format, mode = { "n", "v" }, desc = "Format code" },
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.diagnostics.djlint,
				-- Enhanced semgrep with performance optimizations
				null_ls.builtins.diagnostics.semgrep.with({
					extra_args = { 
						"--config=auto",  -- Smart rules based on detected languages
						"--severity=ERROR", -- Only show high-severity issues
						"--no-git-ignore", -- Respect .gitignore files
					},
					-- Only run on relevant filetypes for better performance
					filetypes = { "python", "javascript", "typescript", "go", "java", "php", "ruby" },
					timeout = 10000, -- 10 second timeout to prevent hanging
				}),
			},
			-- Performance optimization
			debounce = 250, -- Wait 250ms before running diagnostics
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
