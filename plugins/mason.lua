-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    'williamboman/mason-lspconfig.nvim',
    -- overrides `require('mason-lspconfig').setup(...)`
    opts = {
      ensure_installed = { 'lua_ls', 'angular-language-server', 'astro-language-server',
        'azure-pipelines-language-server', 'bash-language-server', 'bicep-lsp', 'bzl', 'clangd', 'cmake-language-server',
        'codeql', 'crystalline', 'csharp-language-server', 'deno', 'docker-compose-language-server',
        'elixir-ls', 'elm-language-server', 'emmet-ls', 'erlang-ls', 'eslint-lsp', 'gopls', 'gradle-language-server',
        'grammarly-language-server', 'graphql-language-server-cli', 'haxe-language-server', 'helm-ls', 'html-lsp',
        'java-language-server', 'json-lsp', 'julia-lsp', 'kotlin-language-server', 'luau-lsp', 'marksman', 'millet',
        'move-analyzer', 'neocmakelsp', 'nimlsp', 'opencl-language-server', 'phpactor', 'powershell-editor-services',
        'prisma-language-server', 'purescript-language-server', 'r-languageserver', 'reason-language-server',
        'remark-language-server', 'rust-analyzer', 'slint-lsp', 'solang', 'solang-llvm', 'sloargraph', 'sorbet',
        'sourcery', 'spectral-language-server', 'stylelint-lsp', 'svelte-language-server', 'tailwindcss-language-server',
        'teal-language-server', 'terraform-ls', 'typescript-language-server', 'vala-language-server',
        'vim-language-server', 'vue-language-server', 'wgsl-analyzer', 'yaml-language-server', 'yls-yara', 'zls',
        'ansible-lint', 'bslint', 'cmakelint', 'codespell', 'commitlint', 'cpplint', 'cspell', 'curlylint',
        'editorconfig-checker', 'gitlint', 'glint', 'golangci-lint', 'gospel', 'hadolint', 'haml-lint', 'jsonlint',
        'ktlint', 'luacheck', 'misspell', 'mypy', 'phpcs', 'phpmd', 'proselint', 'pylana', 'pylint', 'pyre',
        'quick-lint-js', 'revive', 'rome', 'rstchk', 'selene', 'sqlfluff', 'staticcheck', 'textlint', 'vacuum', 'vale',
        'vint', 'vulture', 'xo', 'yamllint'
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    'jay-babu/mason-null-ls.nvim',
    -- overrides `require('mason-null-ls').setup(...)`
    opts = {
      handlers = {
        -- for prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- for prettierd
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                  or utils.root_has_file ".eslintrc.json"
                  or utils.root_has_file ".eslintrc.js"
            end,
          })
        end,
      },
      ensure_installed = { 'beautysh', 'black', 'blade-formatter', 'clang-format', 'cmakelang', 'csharier', 'eslint_d',
        'prettierd', 'prettier', 'elm-format', 'fixjson', 'goimports', 'goimports-reviser', 'golines', 'gomodifytags',
        'google-java-format', 'gotests', 'isort', 'joker', 'ktlint', 'luaformatter', 'remark-cli', 'markdownlint',
        'prettier', 'rustfmt', 'rustywind', 'shellharden', 'shfmt', 'snakefmt', 'sql-formatter', 'stylua', 'usort',
        'verible', 'xmlformatter', 'yamlfmt', 'yapf', },
    },
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    -- overrides `require('mason-nvim-dap').setup(...)`
    opts = {
      ensure_installed = { 'bash-debug-adapter', 'bzl', 'chrome-debug-adapter', 'codelldb', 'cpptools',
        'dart-debug-adapter', 'delve', 'firefox-debug-adapter', 'go-debug-adapter', 'java-debug-adapter', 'java-test',
        'js-debug-adapter', 'kotlin-debug-adapter', 'mockdebug', 'netcoredbg, node-debug2-adapter', 'php-debug-adapter',
        'python' },
    },
  },
}
