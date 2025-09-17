-- Avante.nvim - Cursor-like AI IDE experience
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    -- Provider configuration - using Copilot as default for work laptop
    provider = "copilot", -- Default to Copilot for work environments

    providers = {
      -- Copilot configuration (default for work laptop)
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gpt-4o-2024-08-06",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },

      -- Claude configuration (for personal use)
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },

      -- OpenAI configuration (alternative option)
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },

    -- Behavior settings
    behaviour = {
      auto_suggestions = false, -- Keep false to not interfere with Copilot inline suggestions
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
    },

    -- Window positioning
    windows = {
      position = "right",
      width = 30,
      wrap = true,
      sidebar_header = {
        enabled = true,
        align = "center",
        rounded = true,
      },
    },

    -- Diff handling
    diff = {
      autojump = true,
      list_opener = "copen",
      override_timeoutlen = 500,
    },

    -- Mappings configuration
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      cancel = {
        normal = { "<C-c>", "<Esc>", "q" },
        insert = { "<C-c>" },
      },
    },

    -- Highlights
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Optional dependencies
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua", -- Your existing Copilot plugin
    "hrsh7th/nvim-cmp", -- Already installed
    "nvim-telescope/telescope.nvim", -- Already installed
    "stevearc/dressing.nvim",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  keys = {
    -- Using <leader>a for Avante (now available after moving Claude Code to <leader>c)
    { "<leader>a", nil, desc = "Avante AI" },
    { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Ask Avante" },
    { "<leader>ac", "<cmd>AvanteChat<cr>", desc = "Chat" },
    { "<leader>ae", "<cmd>AvanteEdit<cr>", mode = "v", desc = "Edit selection" },
    { "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "Refresh" },
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Toggle sidebar" },
    { "<leader>af", "<cmd>AvanteFocus<cr>", desc = "Focus sidebar" },
    { "<leader>aX", "<cmd>AvanteClear<cr>", desc = "Clear chat" },
    { "<leader>an", "<cmd>AvanteChatNew<cr>", desc = "New chat" },
    { "<leader>ah", "<cmd>AvanteHistory<cr>", desc = "Chat history" },
    { "<leader>as", "<cmd>AvanteStop<cr>", desc = "Stop AI request" },
    { "<leader>am", "<cmd>AvanteModels<cr>", desc = "Show models" },
    { "<leader>ab", "<cmd>AvanteBuild<cr>", desc = "Build dependencies" },
    { "<leader>ap", "<cmd>AvanteSwitchProvider<cr>", desc = "Switch provider" },
    { "<leader>aR", "<cmd>AvanteShowRepoMap<cr>", desc = "Show repo map" },
    -- Visual mode mappings
    { "<leader>ae", ":AvanteEdit<cr>", mode = "v", desc = "Edit selection" },
    { "<leader>aa", ":AvanteAsk<cr>", mode = "v", desc = "Ask about selection" },
  },
}