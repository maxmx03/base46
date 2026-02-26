local groups = require 'base46.groups'

---@class base46.groups
---@field name string
---@field val vim.api.keyset.highlight

---@class base46.config
---@field colorscheme string
---@field transparency? boolean
---@field themes string[]
---@field groups base46.groups[]

---@class base46.init
local M = {}

---@type base46.config
M.config = {
  colorscheme = '',
  transparency = false,
  themes = {},
  groups = {},
}

---@param opts base46.config
function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts)
  vim.cmd.colorscheme(M.config.colorscheme)
end

---@param palette base46
function M.load_theme(palette)
  groups.load_faces(palette, M.config)
end

return M
