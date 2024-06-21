return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	keys = {
		{ "<Leader>t", ":TestNearest<CR>" },
		{ "<Leader>T", ":TestFile<CR>" },
		{ "<Leader>l", ":TestLast<CR>" },
		{ "<Leader>g", ":TestVisit<CR>" },
	},
  config = function()
    vim.g["test#strategy"] = "vimux"
  end
}
