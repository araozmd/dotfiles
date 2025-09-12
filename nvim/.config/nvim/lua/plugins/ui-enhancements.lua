-- Optional UI enhancements (only load if needed)
-- These are extracted from the large copilot.lua file

return {
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

  -- Document generation helper (optional)
  {
    "danymat/neogen",
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
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}