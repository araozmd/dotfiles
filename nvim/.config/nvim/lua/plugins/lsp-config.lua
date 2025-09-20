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

        -- Explicit LSP keymaps to ensure they work
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright", 
          "ts_ls",
          "jsonls",
          "yamlls",
          "bashls",
        },
        handlers = {
          lsp_zero.default_setup,
          jdtls = lsp_zero.noop,
          stylua = lsp_zero.noop, -- Disable stylua as LSP (it's a formatter, not LSP)
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
