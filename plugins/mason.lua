-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    'williamboman/mason-lspconfig.nvim',
    -- overrides `require('mason-lspconfig').setup(...)`
    opts = {
      ensure_installed = { 'awk_ls', 'angularls', 'arduino_language_server', 'asm_lsp', 'astro', 'azure_pipelines_ls',
        'bashls', 'bicep', 'bright_script', 'clangd', 'csharp_ls', 'cmake', 'neocmake', 'cssls', 'unocss', 'clarity_lsp',
        'clojure_lsp', 'codeqlls', 'crystalline', 'dagger', 'denols', 'dhall_lsp_server', 'diagosticcls', 'serve_d',
        'dockerls', 'docker_compose_language_service', 'dotls', 'droops_lsp', 'efm', 'eslint', 'elixirls', 'elmls',
        'ember', 'emmet_ls', 'erg_language_server', 'erlangls', 'fsautocomplete', 'fennel_language_server', 'flux-lsp',
        'fortls', 'glint', 'gopls', 'gradle_ls', 'grammarly', 'html', 'hls', 'haxe_language_server', 'helm-ls',
        'hoon_ls', 'jsonls', 'jdtls', 'tsserver', 'julials', 'kotlin_language_server', 'lua_ls', 'luau_lsp', 'marksman',
        'remark_ls', 'move_analyzer', 'nickel_ls', 'nimls', 'rnix', 'ocamllsp', 'spectral', 'opencl_ls', 'openscad_ls',
        'psalm', 'perlnavigator', 'powershell_es', 'prismals', 'puppet', 'purescriptls', 'pyright', 'pylsp',
        'r_language_server', 'rescriptls', 'reason_ls', 'robotframework_ls', 'rome', 'solargraph', 'rust_analyzer',
        'sqls', 'salt_ls', 'slint_lsp', 'smithy_ls', 'solang', 'stylelint_lsp', 'svelte', 'taplo', 'tailwindcss',
        'teal_ls', 'terraformls', 'vls', 'vala_ls', 'veryl_ls', 'vimls', 'volar', 'wgsl_analzer', 'yamlls', 'zls',
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
      automatic_installation = true,
      handlers = {
        -- for prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettier.config.js"
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
                  or utils.root_has_file ".prettier.config.js"
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
