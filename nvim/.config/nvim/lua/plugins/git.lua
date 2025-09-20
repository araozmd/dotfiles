return {
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<Leader>G", "<cmd>:G<cr>", desc = "Open Git status" },
			{ "<Leader>gp", "<cmd>:Git push<cr>", desc = "Git push" },
			{ "<Leader>gl", "<cmd>:Git pull<cr>", desc = "Git pull" },
			{ "<Leader>gb", "<cmd>:Git blame<cr>", desc = "Git blame" },
		},
	},
	{
		"airblade/vim-gitgutter",
		event = { "BufReadPre", "BufNewFile" }, -- Load on buffer events instead of keys
		keys = {
			{ "<Leader>gn", "<cmd>GitGutterNextHunk<cr>", desc = "Next git hunk" },
			{ "<Leader>gP", "<cmd>GitGutterPrevHunk<cr>", desc = "Previous git hunk" },
			{ "<Leader>gs", "<cmd>GitGutterStageHunk<cr>", desc = "Stage git hunk" },
			{ "<Leader>gu", "<cmd>GitGutterUndoHunk<cr>", desc = "Undo git hunk" },
			{ "<Leader>gv", "<cmd>GitGutterPreviewHunk<cr>", desc = "Preview git hunk" },
		},
		config = function()
			-- Essential settings for proper functionality
			vim.o.updatetime = 100 -- Recommended by docs for faster updates
			vim.o.signcolumn = "yes" -- Always show sign column

			-- Terminal focus handling (especially important for tmux)
			vim.g.gitgutter_terminal_reports_focus = 0 -- Disable if terminal doesn't report focus

			-- Gitgutter signs with nerdfonts
			vim.g.gitgutter_sign_added = " "
			vim.g.gitgutter_sign_modified = " "
			vim.g.gitgutter_sign_removed = " "
			vim.g.gitgutter_sign_removed_first_line = " "
			vim.g.gitgutter_sign_removed_above_and_below = '󰹺 '
			vim.g.gitgutter_sign_modified_removed = ""

			-- Performance and behavior settings
			vim.g.gitgutter_preview_win_floating = 1
			vim.g.gitgutter_max_signs = 500
			vim.g.gitgutter_sign_priority = 10
			vim.g.gitgutter_sign_allow_clobber = 1 -- Allow gitgutter to override other signs
		end,
	},
	{ "airblade/vim-rooter" },
}