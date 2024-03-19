return {
  { "github/copilot.vim" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    config = function()
      local config = {
        cmd = { "/Users/araozmd/.local/share/nvim/mason/bin/jdtls" },
        root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
      }
      require("jdtls").start_or_attach(config)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "K",          vim.lsp.buf.hover },
      { "gd",         vim.lsp.buf.definition },
      { "gD",         vim.lsp.buf.declaration },
      { "gi",         vim.lsp.buf.implementation },
      { "<Leader>ca", vim.lsp.buf.code_action,   mode = { "n", "v" } },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lsp-zero").setup({
        on_attach = function(client, bufnr)
          require("mason-lspconfig").on_attach(client, bufnr)
        end,
      })

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({
        cmd = { "jdtls" },
        capabilities = capabilities,
      })
      lspconfig.angularls.setup({ capabilities = capabilities })
      lspconfig.sg.setup({ capabilities = capabilities })
    end,
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      "mfussenegger/nvim-jdtls",
    },
  },
}
