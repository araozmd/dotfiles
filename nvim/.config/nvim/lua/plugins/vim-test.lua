return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	keys = {
		{ "<Leader>t", ":TestNearest<CR>", desc = "Run nearest test" },
		{ "<Leader>T", ":TestFile<CR>", desc = "Run tests in file" },
		{ "<Leader>l", ":TestLast<CR>", desc = "Run last test" },
		{ "<Leader>g", ":TestVisit<CR>", desc = "Go to test file" },
	},
  config = function()
    vim.g["test#strategy"] = "vimux"
  end
}
