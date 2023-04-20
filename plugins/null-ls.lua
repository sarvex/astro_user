return {
  'jose-elias-alvarez/null-ls.nvim',
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require 'null-ls'

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.code_actions.ltrs,
      null_ls.builtins.code_actions.proselint,
      null_ls.builtins.code_actions.refactoring,
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.code_actions.statix,
      null_ls.builtins.code_actions.xo,
      null_ls.builtins.completion.luasnip,
      null_ls.builtins.completion.spell,
      null_ls.builtins.completion.tags,
      null_ls.builtins.completion.vsnip,
      null_ls.builtins.diagnostics.actionlint,
      null_ls.builtins.diagnostics.alex,
      null_ls.builtins.diagnostics.ansiblelint,
      null_ls.builtins.diagnostics.bslint,
      null_ls.builtins.diagnostics.buf,
      null_ls.builtins.diagnostics.buildifier,
      null_ls.builtins.diagnostics.cfn_lint,
      null_ls.builtins.diagnostics.checkmake,
      null_ls.builtins.diagnostics.checkstyle.with({ extra_args = { "-c", "/google_checks.xml" }, }),
      null_ls.builtins.diagnostics.chktex,
      null_ls.builtins.diagnostics.clang_check,
      null_ls.builtins.diagnostics.clazy,
      null_ls.builtins.diagnostics.clj_kondo,
      null_ls.builtins.diagnostics.cmake_lint,
      null_ls.builtins.diagnostics.codespell,
      null_ls.builtins.diagnostics.commitlint,
      null_ls.builtins.diagnostics.cppcheck,
      null_ls.builtins.diagnostics.cpplint,
      null_ls.builtins.diagnostics.credo,
      null_ls.builtins.diagnostics.cspell,
      null_ls.builtins.diagnostics.cspell,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.cue_fmt,
    }
    return config -- return final config table
  end,
}
