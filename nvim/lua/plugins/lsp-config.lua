return {
  { "github/copilot.vim" },
  { "mfussenegger/nvim-jdtls" },
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
