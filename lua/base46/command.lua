local command = {}

local subcommands = {
  colors = function(_)
    local base46 = require 'base46'
    local config = base46.config
    local ok, palette = pcall(require, 'colors.' .. config.colorscheme)

    if not ok then
      vim.notify('Base46: theme "' .. config.colorscheme .. '" not found', vim.log.levels.ERROR)
      return
    end

    local colors_desc = {
      base00 = 'Default background',
      base01 = 'Float background',
      base02 = 'Statusline background',
      base03 = 'WinSeparator, Border',
      base04 = 'Statusline foreground',
      base05 = 'Default Foreground, Caret, Delimiters',
      base06 = 'Diff Added',
      base07 = 'Diff Modified',
      base08 = 'Diff Deleted',
      base09 = 'Diagnostic Info, Hint',
      base0A = 'Diagnostic Warning',
      base0B = 'Diagnostics Error',
      base0C = 'Markup Bold',
      base0D = 'Markup Italic',
      base0E = 'Markup url',
      base0F = 'Markup Inline Code',
      base0S = 'Accent (primary color)',
    }

    local buf = vim.api.nvim_create_buf(true, true)
    local max_length = 0
    for color, _ in pairs(palette.base_30 or {}) do
      max_length = math.max(max_length, #color)
    end
    for color, _ in pairs(palette.base_16 or {}) do
      max_length = math.max(max_length, #color)
    end

    local function set_lines(color, hex, line)
      vim.api.nvim_buf_set_lines(buf, line, (line + 1), false, {
        color .. string.rep('.', max_length - #color + 2) .. hex .. '  ' .. (colors_desc[color] or ''),
      })
      return line + 1
    end

    local line = 0

    if palette.base_30 then
      line = set_lines('base_30', '', line)
      for color, hex in pairs(palette.base_30) do
        line = set_lines(color, hex, line)
      end
    end

    if palette.base_16 then
      line = set_lines('base_16', '', line)
      for color, hex in pairs(palette.base_16) do
        line = set_lines(color, hex, line)
      end
    end

    vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    vim.api.nvim_set_option_value('filetype', 'Base46', { buf = buf })
    vim.api.nvim_buf_set_name(buf, 'Base46 Colors')
    vim.api.nvim_win_set_buf(0, buf)
  end,
}

function command.list()
  return vim.tbl_keys(subcommands)
end

function command.load(cmd, arg)
  if subcommands[cmd] then
    subcommands[cmd](arg)
  else
    vim.notify('Base46: unknown subcommand "' .. cmd .. '"', vim.log.levels.ERROR)
  end
end

return command
