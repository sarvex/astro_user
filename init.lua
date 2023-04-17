return {
  -- Configure AstroNvim updates
  updater = {
    remote = 'origin', -- remote to use
    channel = 'stable', -- 'stable' or 'nightly'
    version = 'latest', -- 'latest', tag name, or regex search like 'v1.*' to only do updates before v2 (STABLE ONLY)
    branch = 'nightly', -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ['remote_name'] = 'https://remote_url.come/repo.git', -- full remote url
      --   ['remote2'] = 'github_user/repo', -- GitHub user/repo shortcut,
      --   ['remote3'] = 'github_user', -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = 'astrodark',

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- 'go',
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- 'python',
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- 'lua_ls',
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- 'pyright'
    },
  },

  -- Configure require('lazy').setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { 'tohtml', 'gzip', 'matchit', 'zipPlugin', 'netrwPlugin', 'tarPlugin' },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    if vim.g.neovide then
      vim.o.guifont = 'SauceCodePro NF:h11' 
      vim.opt.linespace = 0
      vim.g.neovide_padding_top = 0
      vim.g.neovide_padding_bottom = 0
      vim.g.neovide_padding_right = 0
      vim.g.neovide_padding_left = 0
      vim.g.neovide_transparency = 0.8
      vim.g.transparency = 0.8
      vim.g.neovide_background_color = '#0f1117' .. string.format('%x', math.floor(255 * vim.g.transparency or 0.8))
      vim.g.neovide_floating_blur_amount_x = 2.0
      vim.g.neovide_floating_blur_amount_y = 2.0
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_cursor_trail_size = 0.8
      vim.g.neovide_cursor_antialiasing = true
      vim.g.neovide_cursor_animate_in_insert_mode = true
      vim.g.neovide_cursor_animate_command_line = true
      vim.g.neovide_cursor_unfocused_outline_width = 0.125
      vim.g.neovide_cursor_vfx_mode = 'railgun'
      vim.g.neovide_cursor_vfx_opacity = 200.0
      vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
      vim.g.neovide_cursor_vfx_particle_density = 7.0
      vim.g.neovide_cursor_vfx_particle_speed = 10.0
      vim.g.neovide_cursor_vfx_particle_phase = 1.5
      vim.g.neovide_cursor_vfx_particle_curl = 1.0
    elseif vim.g.vscode then
    end


    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = 'fooscript',
    --   },
    --   filename = {
    --     ['Foofile'] = 'fooscript',
    --   },
    --   pattern = {
    --     ['~/%.config/foo/.*'] = 'fooscript',
    --   },
    -- }
  end,
}
