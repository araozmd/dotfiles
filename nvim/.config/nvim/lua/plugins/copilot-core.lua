-- Core GitHub Copilot configuration
-- Minimal setup for maximum performance

return {
  -- Core Copilot: Lua-native client for better integration
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
            position = "bottom",
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
        copilot_node_command = 'node',
        server_opts_overrides = {},
      })
    end,
  },

  -- CopilotChat for interactive AI conversations
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatExplain", "CopilotChatReview", "CopilotChatFix", "CopilotChatOptimize" },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      -- Essential chat commands only (nested under <leader>cp for copilot)
      { "<leader>cp", nil, desc = "Copilot Chat" },
      { "<leader>cpc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      { "<leader>cpe", ":CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
      { "<leader>cpf", ":CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix the problem" },
      { "<leader>cpo", ":CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize code" },
      { "<leader>cpr", ":CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review code" },
      { "<leader>cpd", ":CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Add documentation" },
      { "<leader>cpm", ":CopilotChatCommitStaged<cr>", desc = "Generate commit message" },
      {
        "<leader>cpq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Quick chat"
      },
    },
    config = function()
      require("CopilotChat").setup({
        debug = false,
        model = 'gpt-5',
        temperature = 0.1,
        question_header = ' User ',
        answer_header = ' Copilot ',
        error_header = ' Error ',
        show_help = true,
        auto_follow_cursor = true,
        auto_insert_mode = false,
        clear_chat_on_new_prompt = false,
        context = 'buffers',
        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
          },
          Review = {
            prompt = '/COPILOT_REVIEW Review the selected code.',
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
          CommitStaged = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Use gitmoji when appropriate. Wrap the whole message in code block with language gitcommit.',
            selection = require('CopilotChat.select').gitdiff,
          },
        },
      })
    end,
  },

  -- Integration with nvim-cmp for suggestions in completion menu
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Copilot status in lualine
  {
    "AndreM222/copilot-lualine",
    dependencies = { "zbirenbaum/copilot.lua" },
    lazy = true, -- Loaded by lualine
  },
}
