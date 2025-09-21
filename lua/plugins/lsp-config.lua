return {
  {
      "mason-org/mason.nvim",
      config = function()
        require("mason").setup()
      end,
      opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "pyright",
          "ts_ls",
          "docker_compose_language_service",
          "docker_language_server",
        },
    },
    config = function()
      require("mason-lspconfig").setup()

      -- Broadcasting the new auto completions capabilities to the LSP servers.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      --local lspconfig = require("lspconfig")

      vim.lsp.config["lua_ls"] = {
        capabilities = capabilities,
        filetypes = { "lua" }
      }

      vim.lsp.config["pyright"] = {
        capabilities = capabilities,
        filetypes = { "py" }
      }
--      lspconfig.lua_ls.setup({
--        capabilities = capabilities
--      })
--      lspconfig.pyright.setup({
--        capabilities = capabilities
--      })

      --  Enabling lua_ls server
      vim.lsp.enable("lua_ls")
      --  Enabling pyright server
      vim.lsp.enable("pyright")

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover documentation' })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: Go to definition' })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: Go to declaration' })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: Code actions' })
        end
      })
    end,
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    }
  }
}
