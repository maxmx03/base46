---@base46.palette
local c = vim.g.base46_palette
local color = require 'base46.color'
local shade = color.shade

local lualine = {
  normal = {
    a = { fg = shade(c.blue, 5), bg = c.blue, gui = 'bold' },
    b = { fg = c.base_16.base01, bg = c.base_30.base04 },
    c = { fg = c.base_30.base04, bg = c.base_16.base01 },
    z = { fg = c.base_30.base01, bg = c.blue },
  },
  insert = {
    a = { fg = shade(c.green, 5), bg = c.green },
  },
  visual = {
    a = { fg = shade(c.magenta, 5), bg = c.magenta },
  },
  replace = {
    a = { fg = shade(c.red, 5), bg = c.red },
  },
  command = {
    a = { fg = shade(c.orange, 5), bg = c.orange },
  },
}
return lualine
