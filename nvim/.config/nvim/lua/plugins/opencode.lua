-- OpenCode.nvim - A Neovim plugin to interact with OpenCode AI services
return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask` and `select()`.
    -- Reguired for `toggle()`
    {"folke/snacks.nvim", ops = { input = {}, picker = {} }}
  },
  config = function()
    vim.g.opencode_opts = {}
    -- Required for `vim.g.opencode_opts_auto_reload`.
    vim.o.autoread = true
  end,
  keys = {
    { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = {"n", "x"}, desc = "󱙻 Ask about this" },
    { "<leader>os", function() require("opencode").select() end, mode = {"n", "x"}, desc = "󱙻 Select prompt" },
    { "<leader>o+", function() require("opencode").prompt("@this") end, mode = {"n", "x"}, desc = "󱙻 Add this" },
    { "<leader>ot", function() require("opencode").toggle() end, desc = "󱙻 Toggle" },
    { "<leader>oc", function() require("opencode").command() end, desc = "󱙻 Select command" },
    { "<leader>on", function() require("opencode").command("session_new") end, desc = "󱙻 New session" },
    { "<leader>oi", function() require("opencode").command("session_interrupt") end, desc = "󱙻 Interrupt session" },
    { "<leader>oA", function() require("opencode").command("agent_cycle") end, desc = "󱙻 Cycle selected agent" },
    { "<C-S-u>", function() require("opencode").command("messages_half_page_up") end, desc = "󱙻 Messages half page up" },
    { "<C-S-d>", function() require("opencode").command("messages_half_page_down") end, desc = "󱙻 Messages half page down" },
  },
}
