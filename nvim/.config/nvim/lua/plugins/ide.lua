-- Utils to make vim more like a IDE
return {
  {
    'NvChad/nvim-colorizer.lua',
    event = "VeryLazy",
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 
          "lua", "python", "javascript", "typescript", "markdown", "json", "yaml", "bash", "html", "css"
        },
        auto_install = false, -- Don't auto-install everything
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        }
      }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 
      { 'nvim-tree/nvim-web-devicons', lazy = true },
      { 'AndreM222/copilot-lualine', lazy = true },
    },
    opts = {
      options = {
        theme = 'catppuccin',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
          {
            'copilot',
            show_colors = true,
            show_loading = true,
          },
          'encoding',
          'fileformat',
          'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")
      wk.setup({
        preset = "modern",
      })

      -- Add visual mode hints for various plugins
      wk.add({
        -- Visual mode leader hints
        { "<leader>", group = "Leader", mode = "v" },

        -- Avante AI hints (visual mode)
        { "<leader>a", group = "Avante AI", mode = "v", icon = "󰚩" },
        { "<leader>ae", desc = "Edit with AI", mode = "v", icon = "" },
        { "<leader>aa", desc = "Ask AI about selection", mode = "v", icon = "" },

        -- Copilot Chat hints (visual mode)
        { "<leader>cp", group = "Copilot", mode = "v", icon = "" },
        { "<leader>cpe", desc = "Explain code", mode = "v", icon = "󰆈" },
        { "<leader>cpf", desc = "Fix problem", mode = "v", icon = "" },
        { "<leader>cpo", desc = "Optimize code", mode = "v", icon = "󰓕" },
        { "<leader>cpr", desc = "Review code", mode = "v", icon = "" },
        { "<leader>cpd", desc = "Add docs", mode = "v", icon = "󰈙" },

        -- LSP hints (visual mode)
        { "<leader>c", group = "Code", mode = "v", icon = "" },
        { "<leader>ca", desc = "Code actions", mode = "v", icon = "󰌵" },

        -- Git hints (visual mode)
        { "<leader>g", group = "Git", mode = "v", icon = "" },
        { "<leader>gs", desc = "Stage selection", mode = "v", icon = "" },
      })
    end,
  }
}
