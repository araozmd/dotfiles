return {
	--  {
	--    'morhetz/gruvbox',
	--    config = function()
	--      vim.cmd([[colorscheme gruvbox]])
	--      vim.g.gruvbox_contrast_dark = "hard"
	--    end
	--  },
	{
		"dracula/vim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup()
			vim.cmd([[ colorscheme catppuccin-mocha ]])
		end,
	},
}
