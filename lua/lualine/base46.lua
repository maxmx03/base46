---@base46.palette
local c = vim.g.base46_palette
local lualine = {
  normal = {
    a = { fg = c.base_30.base01, bg = c.blue, gui = 'bold' },
    b = { fg = c.base_16.base01, bg = c.base_30.base04 },
    c = { fg = c.base_30.base04, bg = c.base_16.base01 },
    z = { fg = c.base_30.base01, bg = c.blue },
  },
  insert = {
    a = { fg = c.base_30.base01, bg = c.green },
  },
  visual = {
    a = { fg = c.base_30.base01, bg = c.magenta },
  },
  replace = {
    a = { fg = c.base_30.base01, bg = c.red },
  },
  command = {
    a = { fg = c.base_30.base01, bg = c.orange },
  },
}
return lualine
