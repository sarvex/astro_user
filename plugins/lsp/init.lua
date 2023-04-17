return {
  lsp = {
    config = {
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json")
        return opts
      end,
      dartls = {
        -- any changes you want to make to the LSP setup, for example
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      }
    },
    setup_handlers = {
      -- add custom handler
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
      denols = function(_, opts) require("deno-nvim").setup { server = opts } end,
      clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
      dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
      rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
      eslint = function(_, opts) require("lspconfig.util").root_pattern("package.json", ".eslintrc.json", ".eslintrc.js").setup{server = opts } end,
      jdtls = function(_, opts)
        vim.api.nvim_create_autocmd("Filetype", {
          pattern = "java", -- autocmd to start jdtls
          callback = function()
            if opts.root_dir and opts.root_dir ~= "" then require("jdtls").start_or_attach(opts) end
          end,
        })
      end
    }
  },
  plugins = {
    { "jose-elias-alvarez/typescript.nvim", -- add lsp plugin
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "tsserver" }, -- automatically install lsp
        },
      },
    },
    {
      "sigmasd/deno-nvim", -- add lsp plugin
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "denols" }, -- automatically install lsp
        },
      },
    },
    {
      "p00f/clangd_extensions.nvim", -- install lsp plugin
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "clangd" }, -- automatically install lsp
        },
      },
    },
    {
      "simrat39/rust-tools.nvim", -- add lsp plugin
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "rust_analyzer" },
        },
      },
    },
    {
      "mfussenegger/nvim-jdtls", -- load jdtls on module
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "jdtls" },
        },
      },
    },
  },
}
