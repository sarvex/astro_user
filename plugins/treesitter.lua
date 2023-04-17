return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'HiPhish/nvim-ts-rainbow2', 'theHamsta/nvim-treesitter-pairs', 'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-context', 'nvim-treesitter/nvim-treesitter-context',
      'mfussenegger/nvim-treehopper', 'mfussenegger/nvim-treehopper' },
    opts = {
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true
      },
      auto_install = true,
      ensure_installed = { 'astro', 'awk', 'bash', 'bicep', 'c', 'c_sharp', 'clojure', 'cmake', 'comment', 'cpp', 'css',
        'd', 'dart', 'diff', 'dockerfile', 'dot', 'elixir', 'elm', 'erlang', 'fortran', 'fish', 'gdscript', 'gitcommit',
        'gitignore', 'gleam', 'glimmer', 'go', 'gomod', 'graphql', 'hare', 'html', 'htmldjango',
        'http', 'ini', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'jsonc', 'julia', 'kotlin', 'llvm', 'lua',
        'luadoc', 'luap', 'make', 'markdown', 'nix', 'org', 'perl', 'php', 'phpdoc', 'prisma', 'pug',
        'python', 'query', 'r', 'racket', 'regex', 'rst', 'ruby', 'rust', 'scss', 'slint', 'solidity', 'sparql', 'sql',
        'squirrel', 'starlark', 'supercollider', 'surface', 'svelte', 'swift', 'teal', 'terraform', 'thrift', 'tiger',
        'toml', 'tsx', 'turtle', 'twig', 'typescript', 'v', 'vala', 'vim', 'vimdoc', 'vue', 'wgsl',
        'wgsl_bevy', 'yaml', 'yuck', 'zig'
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn', -- set to `false` to disable one of the mappings
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      indent = {
        enable = true
      },
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        -- disable = { 'c', 'ruby' }, -- optional, list of language that will be disabled
        -- [options]
      },
      pairs = {
        enable = true,
        disable = {},
        highlight_pair_events = {},                                   -- e.g. {'CursorMoved'}, -- when to highlight the pairs, use {} to deactivate highlighting
        highlight_self = false,                                       -- whether to highlight also the part of the pair under cursor (or only the partner)
        goto_right_end = false,                                       -- whether to go to the end of the right partner or the beginning
        fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. 'normal! %')
        keymaps = {
          goto_partner = '<leader>%',
          delete_balanced = 'X',
        },
        delete_balanced = {
          only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
          fallback_cmd_normal = nil,  -- fallback command when no pair found, can be nil
          longest_partner = false,    -- whether to delete the longest or the shortest pair when multiple found.
          -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
        },
      },
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { 'jsx', 'cpp' },
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
      },
      sync_install = false,
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    opts = {
      refactor = {
        highlight_current_scope = { enable = true },
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
        navigation = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
          keymaps = {
            goto_definition = 'gnd',
            list_definitions = 'gnD',
            list_definitions_toc = 'gO',
            goto_next_usage = '<a-*>',
            goto_previous_usage = '<a-#>',
          },
        },
        smart_rename = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
          keymaps = {
            smart_rename = 'grr',
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    opts = {
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = { query = '@class.outer', desc = 'Next class start' },
            --
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a 'query' key to group multiple queires.
            [']o'] = '@loop.*',
            -- [']o'] = { query = { '@loop.inner', '@loop.outer' } }
            --
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            [']d'] = '@conditional.outer',
          },
          goto_previous = {
            ['[d'] = '@conditional.outer',
          },
        },
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            -- You can also use captures from other query groups like `locals.scm`
            ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/playground',
    opts = {
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
      trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
    },
  },
  {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'ziontee113/syntax-tree-surfer',
    opts = {
      -- Holds a node, or swaps the held node
      vim.keymap.set('n', 'gnh', '<cmd>STSSwapOrHold<cr>', opts),
      -- Same for visual
      vim.keymap.set('x', 'gnh', '<cmd>STSSwapOrHoldVisual<cr>', opts),
    },
  },
}
