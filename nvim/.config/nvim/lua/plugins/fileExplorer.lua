return {
--  {
--    'preservim/nerdtree',
--    keys = {
--      { "<Leader>nt", "<cmd>:NERDTreeFind<cr>", desc = "Opend NerdTree" },
--    },
--    dependencies = {
--      'Xuyuanp/nerdtree-git-plugin',
--      'ryanoasis/vim-devicons',
--      'tiagofumo/vim-nerdtree-syntax-highlight'
--    },
--    config = function()
--      vim.g.NERDTreeShowHidden = 1
--      vim.g.NERDTreeQuitOnOpen = 1
--      vim.g.NERDTreeAutoDeleteBuffer = 1
--      vim.g.NERDTreeMinimalUI = 1
--      vim.g.NERDTreeDirArrows = 1
--      vim.g.NERDTreeShowLineNumbers = 1
--      vim.g.NERDTreeGitStatusUseNerdFonts = 1
--    end
--  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      { "<Leader>nt", "<cmd>:Neotree toggle<cr>", desc = "Toggle Neo-tree file explorer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        popup_border_style = "rounded",
        enable_git_status = true,
        source_selector = {
          winbar = true,
          statusline = false,
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignore = false,
            hide_hidden = false,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          group_empty_dirs = true,
          hijack_netrw_behavior = 'open_default',
          use_libuv_file_watcher = true,
        }
      }
    end,
  }
}
