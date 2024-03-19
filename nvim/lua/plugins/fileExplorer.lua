return {
  {
    'preservim/nerdtree',
    keys = {
      { "<Leader>nt", "<cmd>:NERDTreeFind<cr>", desc = "Opend NerdTree" },
    },
    dependencies = {
      'Xuyuanp/nerdtree-git-plugin',
      'ryanoasis/vim-devicons',
      'tiagofumo/vim-nerdtree-syntax-highlight'
    },
    config = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeQuitOnOpen = 1
      vim.g.NERDTreeAutoDeleteBuffer = 1
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeDirArrows = 1
      vim.g.NERDTreeShowLineNumbers = 1
      vim.g.NERDTreeGitStatusUseNerdFonts = 1
    end
  }
  --  "nvim-neo-tree/neo-tree.nvim",
  --  branch = "v3.x",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --    "MunifTanjim/nui.nvim",
  --    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --  },
  --  keys = {
  --    { "<Leader>fi", "<cmd>:Neotree filesystem reveal left<cr>", desc = "Opend NerdTree" },
  --  },
  --  config = function()
  --    require'neo-tree'.setup {
  --      event_handlers = {
  --        {
  --          event = "file_opened",
  --          handler = function()
  --            require'neo-tree.command'.execute { action = 'close' }
  --          end
  --        }
  --      }
  --    }
  --  end
}
