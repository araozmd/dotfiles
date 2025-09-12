return {
  -- Copilot is now configured in copilot.lua file
  { "mfussenegger/nvim-jdtls" },
  { "neovim/nvim-lspconfig",
    keys = {
      { "<Leader>K", vim.lsp.buf.hover, desc = "Show hover documentation" },
      { "<Leader>ca", vim.lsp.buf.code_action, desc = "Show code actions" },
    },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          jdtls = lsp_zero.noopt,
        },
      })
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
}
