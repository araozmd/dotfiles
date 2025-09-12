-- GitHub Copilot comprehensive configuration
-- Optimized for maximum productivity with Copilot as primary AI assistant

return {
  -- Core Copilot: Switch from copilot.vim to copilot.lua for better integration
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },

  -- CopilotChat for interactive AI conversations
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      model = 'gpt-4',
      temperature = 0.1,
      question_header = '## User ',
      answer_header = '## Copilot ',
      error_header = '## Error ',
      separator = '---',
      show_folds = true,
      show_help = true,
      auto_follow_cursor = true,
      auto_insert_mode = false,
      clear_chat_on_new_prompt = false,
      highlight_selection = true,
      context = 'buffers',
      history_path = vim.fn.stdpath('data') .. '/copilotchat_history',
      callback = nil,
      selection = function(source)
        return require('CopilotChat.select').visual(source) or require('CopilotChat.select').buffer(source)
      end,
      prompts = {
        Explain = {
          prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
        },
        Review = {
          prompt = '/COPILOT_REVIEW Review the selected code.',
          callback = function(response, source)
            -- Add review comments as virtual text
            local ns = vim.api.nvim_create_namespace('copilot_review')
            local lines = vim.split(response, '\n')
            local bufnr = source.bufnr
            for _, line in ipairs(lines) do
              if line:find('^line') then
                local line_num = tonumber(line:match('%d+'))
                if line_num then
                  vim.api.nvim_buf_set_extmark(
                    bufnr,
                    ns,
                    line_num - 1,
                    0,
                    { virtual_text = { { line, 'Comment' } } }
                  )
                end
              end
            end
          end,
        },
        Fix = {
          prompt = '/COPILOT_FIX There is a problem in this code. Rewrite the code to show it with the bug fixed.',
        },
        Optimize = {
          prompt = '/COPILOT_OPTIMIZE Optimize the selected code to improve performance and readability.',
        },
        Docs = {
          prompt = '/COPILOT_DOCS Please add documentation comments for the selected code.',
        },
        Tests = {
          prompt = '/COPILOT_TESTS Please generate tests for my code.',
        },
        FixDiagnostic = {
          prompt = 'Please assist with the following diagnostic issue in file:',
          selection = require('CopilotChat.select').diagnostics,
        },
        CommitStaged = {
          prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
          selection = require('CopilotChat.select').gitdiff,
        },
        BetterNaming = {
          prompt = 'Please provide better names for the following variables and functions.',
        },
        Refactor = {
          prompt = '/COPILOT_REFACTOR Refactor the selected code to improve its clarity and readability.',
        },
        Summary = {
          prompt = 'Please provide a summary of the following text.',
        },
      },
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert ='<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>'
        },
        reset = {
          normal ='<C-r>',
          insert = '<C-r>'
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-m>'
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>'
        },
        yank_diff = {
          normal = 'gy',
        },
        show_diff = {
          normal = 'gd'
        },
        show_system_prompt = {
          normal = 'gp'
        },
        show_user_selection = {
          normal = 'gs'
        },
      },
    },
    keys = {
      -- Chat commands
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      { "<leader>cx", "<cmd>CopilotChatReset<cr>", desc = "Clear chat history" },
      { "<leader>cs", "<cmd>CopilotChatSave<cr>", desc = "Save chat history" },
      { "<leader>cl", "<cmd>CopilotChatLoad<cr>", desc = "Load chat history" },
      
      -- Inline assistance
      { "<leader>ci", ":CopilotChatInline<cr>", mode = { "n", "v" }, desc = "Inline chat" },
      
      -- Code understanding
      { "<leader>ce", ":CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
      { "<leader>cr", ":CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review code" },
      
      -- Code improvement
      { "<leader>cf", ":CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix the problem" },
      { "<leader>co", ":CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize code" },
      { "<leader>cd", ":CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Add documentation" },
      { "<leader>ct", ":CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Generate tests" },
      { "<leader>cR", ":CopilotChatRefactor<cr>", mode = { "n", "v" }, desc = "Refactor code" },
      { "<leader>cn", ":CopilotChatBetterNaming<cr>", mode = { "n", "v" }, desc = "Better naming" },
      
      -- Fix diagnostic
      { "<leader>cD", ":CopilotChatFixDiagnostic<cr>", desc = "Fix diagnostic" },
      
      -- Git
      { "<leader>cm", ":CopilotChatCommitStaged<cr>", desc = "Generate commit message" },
      
      -- Quick chat
      {
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Quick chat"
      },
      
      -- Chat with visual selection
      {
        "<leader>cv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "Open in vertical split"
      },
      {
        "<leader>cx",
        ":CopilotChatInline<cr>",
        mode = "x",
        desc = "Inline chat"
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      
      -- Use unnamed register for the selection
      opts.selection = select.unnamed
      
      -- Override the git prompts message to use commitizen format
      opts.prompts.CommitStaged = {
        prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Use gitmoji when appropriate. Wrap the whole message in code block with language gitcommit.",
        selection = select.gitdiff,
      }
      
      chat.setup(opts)
      
      -- Setup CMP integration
      require("CopilotChat.integrations.cmp").setup()
      
      -- Create custom commands
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = '*', range = true })
      
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = 'float',
            relative = 'cursor',
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = '*', range = true })
      
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = '*' })
      
      vim.api.nvim_create_user_command("CopilotChatInPlace", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = 'replace',
          },
        })
      end, { nargs = '*', range = true })
    end,
  },

  -- Copilot status in lualine
  {
    "AndreM222/copilot-lualine",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      -- We'll configure this in the lualine setup
    end,
  },

  -- Integration with nvim-cmp for suggestions in completion menu
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Better UI for inputs and selects (enhances CopilotChat prompts)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left",
        insert_only = true,
        start_in_insert = true,
        anchor = "SW",
        border = "rounded",
        relative = "cursor",
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },
        win_options = {
          winblend = 0,
          wrap = false,
        },
      },
      select = {
        enabled = true,
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        telescope = {
          theme = "dropdown",
        },
      },
    },
  },

  -- Document generation helper
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = {
      { "<leader>cg", "<cmd>Neogen<cr>", desc = "Generate annotations (Neogen)" },
    },
    config = function()
      require("neogen").setup({
        enabled = true,
        snippet_engine = "luasnip",
      })
    end,
  },

  -- Testing integration (to run tests that Copilot generates)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- Add test adapters based on your needs:
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-rust",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug nearest test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest"),
          require("neotest-python"),
          require("neotest-go"),
          require("neotest-rust"),
        },
      })
    end,
  },

  -- Format integration (apply Copilot's suggested formatting)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    },
  },

  -- Linting integration (validate Copilot's code)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "pylint" },
        go = { "golangcilint" },
        rust = { "clippy" },
      }
      
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}