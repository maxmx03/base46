local groups = require 'base46.groups'

---@class base46.plugins
---@field bufferline boolean
---@field nvimtree boolean
---@field neotree boolean
---@field lspconfig boolean
---@field telescope boolean
---@field dashboard boolean
---@field gitsigns boolean
---@field dired boolean
---@field cmp boolean
---@field blink boolean
---@field navic boolean
---@field markview boolean
---@field modeline boolean
---@field hydra boolean
---@field rainbow boolean
---@field mason boolean
---@field flutterTools boolean
---@field supermaven boolean

---@class base46.groups
---@field name string
---@field val vim.api.keyset.highlight

---@class base46.config
---@field colorscheme string
---@field transparency? boolean
---@field themes string[]
---@field groups base46.groups[]
---@field plugins base46.plugins

---@class base46.init
local M = {}

---@type base46.config
M.config = {
  colorscheme = '',
  transparency = false,
  themes = {},
  groups = {},
  plugins = {
    bufferline = true,
    nvimtree = true,
    neotree = true,
    lspconfig = true,
    telescope = true,
    dashboard = true,
    gitsigns = true,
    dired = true,
    cmp = true,
    blink = true,
    navic = true,
    markview = true,
    modeline = true,
    hydra = true,
    rainbow = true,
    mason = true,
    flutterTools = true,
    supermaven = true,
  },
}

---@param opts base46.config
function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts)
  vim.cmd.colorscheme(M.config.colorscheme)
end

---@param palette base46
function M.load_theme(palette)
  vim.g.base46_palette = palette
  groups.load_faces(palette, M.config)
end

return M
