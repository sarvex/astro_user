return function()

  local function yaml_ft(path, bufnr)
    -- get content of buffer as string
    local content = vim.filetype.getlines(bufnr)
    if type(content) == "table" then content = table.concat(content, "\n") end

    -- check if file is in roles, tasks, or handlers folder
    local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
    if path_regex and path_regex:match_str(path) then return "yaml.ansible" end
    -- check for known ansible playbook text and if found, return yaml.ansible
    local regex = vim.regex "hosts:\\|tasks:"
    if regex and regex:match_str(content) then return "yaml.ansible" end

    -- return yaml if nothing else
    return "yaml"
  end

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

  vim.filetype.add {
    extension = {
      qmd = "markdown",
      yml = yaml_ft,
      yaml = yaml_ft,
    },
    pattern = {
      ["/tmp/neomutt.*"] = "markdown",
    },
  }

  require "user.autocmds"
end
