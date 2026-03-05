# Base46

A powerful Neovim color scheme builder and manager inspired by base16, designed to create beautiful and accessible color schemes.

## Features

- **Base16 Compatible** - Built on the base16 color specification
- **High Contrast Support** - Integrated contrast checker tools for accessibility
- **Transparent Backgrounds** - Optional transparency support
- **Two Color Palettes** - `base_30` for UI elements and `base_16` for syntax highlighting
- **Treesitter Queries** - Enhanced syntax highlighting with treesitter

## Resources

- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) - Check color contrast ratios for accessibility
- [Coolors](https://coolors.co) - Create and explore color palettes
- [ColorHex](https://www.colorhexa.com) - Color encyclopedia and converter
- [256 Colors Cheat Sheet](https://www.ditig.com/publications/256-colors-cheat-sheet) - Terminal color reference

## Installation

### Using a plugin manager

```lua
-- Using lazy.nvim
{
  "maxmx03/base46",
  config = function()
    require("base46").setup({
      colorscheme = "theme_name",
      transparency = false
    })
  end
}
```

### Manual Setup

```bash
mkdir -p ~/.config/nvim/colors
nvim ~/.config/nvim/colors/theme_name.lua
```

## Creating a Theme

Create a new theme file in `~/.config/nvim/colors/`:

```lua
---@class base46
local theme_name = {
  name = 'theme_name',
  none = 'NONE',
  yellow = '',
  cyan = '',
  blue = '',
  darkblue = '',
  green = '',
  orange = '',
  violet = '',
  magenta = '',
  red = '',
  base_30 = {
    base00 = '', -- Default background
    base01 = '', -- Float background
    base02 = '', -- Statusline background
    base03 = '', -- WinSeparator, Border
    base04 = '', -- Statusline foreground
    base05 = '', -- Default Foreground, Caret, Delimiters, Operators
    base06 = '', -- Diff Added
    base07 = '', -- Diff Modified
    base08 = '', -- Diff Deleted
    base09 = '', -- Diagnostic Info, Hint
    base0A = '', -- Diagnostic Warning
    base0B = '', -- Diagnostics Error
    base0C = '', -- Markup Bold
    base0D = '', -- Markup Italic
    base0E = '', -- Markup url
    base0F = '', -- Markup Inline Code
    base0G = '', -- Markup Heading 1
    base0H = '', -- Markup Heading 2
    base0I = '', -- Markup Heading 3
    base0J = '', -- Markup Heading 4
    base0K = '', -- Markup Heading 5
    base0L = '', -- Markup Heading 6
    base0M = '', -- Markup Tag
    base0N = '', -- Markup Tag Attribute
    base0O = '', -- Markup Tag Delimiter
    base0P = '', -- Pmenu Background
    base0Q = '', -- Folder Background
    base0R = '', -- Cursor Color
    base0S = '', -- Accent, can be used as primary color
    base0T = '', -- Title
  },
  base_16 = {
    base00 = '', -- LineNr
    base01 = '', -- Lighter Background (folding marks)
    base02 = '', -- Selection, Visual Background
    base03 = '', -- Comments, Invisibles, Line Highlighting
    base04 = '', -- Variable Parameter
    base05 = '', -- Caret, Delimiters, Operators
    base06 = '', -- Property, Variable Member
    base07 = '', -- PreProc, Include, Define, Macro, PreCondit
    base08 = '', -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = '', -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = '', -- Classes, Markup Bold, Search Text Background
    base0B = '', -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = '', -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = '', -- Functions, Methods, Attribute IDs, Headings
    base0E = '', -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = '', -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  },
  groups = {}
}

local base46 = require 'base46'
base46.load_theme(theme_name)
```

## Configuration

```lua
-- inside init.lua
require('base46').setup({
    colorscheme = 'theme_name',
    transparency = false
})
```

### Options

| Option         | Type    | Default     | Description                              |
| -------------- | ------- | ----------- | ---------------------------------------- |
| `colorscheme`  | string  | `"default"` | Theme name to load                       |
| `transparency` | boolean | `false`     | Enable transparent backgrounds           |
| `themes`       | table   | `{}`        | List of theme names for telescope picker |
| `groups`       | table   | `{}`        | User highlight groups customization      |
| `plugins`      | table   | see below   | Plugin integrations toggle              |

#### Default Plugins

The following plugins are integrated by default. Set to `false` to disable specific plugin highlights:

```lua
plugins = {
  bufferline = true,    -- bufferline.nvim
  nvimtree = true,      -- nvim-tree.lua
  neotree = true,       -- neo-tree.nvim
  lspconfig = true,     -- nvim-lspconfig
  telescope = true,     -- telescope.nvim
  dashboard = true,     -- dashboard-nvim
  gitsigns = true,      -- gitsigns.nvim
  dired = true,         -- dired.nvim
  cmp = true,           -- nvim-cmp
  navic = true,         -- nvim-navic
  markview = true,      -- markview.nvim
  modeline = true,      -- vim-modeline (nvim-modeline)
  hydra = true,         -- hydra.nvim
  rainbow = true,       -- rainbow-delimiters
  mason = true,         -- mason.nvim
  flutterTools = true,  -- flutter-tools.nvim
  supermaven = true,   -- supermaven-nvim
}
```

## Color Reference

### base_30 (UI Colors)

Designed for Neovim UI elements with a 30-color palette optimized for modern interfaces.

### base_16 (Syntax Colors)

Follows the original base16 specification for syntax highlighting with 16 colors.

## API Reference

### `require('base46').setup(opts)`

Initialize the plugin and apply the theme.

```lua
require('base46').setup({
    colorscheme = 'theme_name',
    transparency = false,
    groups = { { name = '', val = { fg = '', bg = '' } } },
    themes = {'theme1', 'theme2'}  -- for telescope picker
})
```

### `require('base46').load_theme(palette)`

Load a theme directly.

```lua
local base46 = require 'base46'
local my_theme = require('colors.my_theme')
base46.load_theme(my_theme)
```

### `require('base46').config`

Access the current configuration.

```lua
local config = require('base46').config
print(config.colorscheme)
```

## Color Utilities

The plugin includes color manipulation utilities at `require('base46.color')`:

```lua
local color = require('base46.color')

-- Convert hex to RGB
local r, g, b = color.hex_to_rgb('#ff0000')

-- Convert RGB to hex
local hex = color.rgb_to_hex(255, 0, 0)

-- Darken a color by percentage
local darker = color.darken('#ff0000', 20)

-- Lighten a color by percentage
local lighter = color.lighten('#ff0000', 20)

-- Shade a color (0-10 range)
local shaded = color.shade('#ff0000', 2)

-- Tint a color (0-10 range)
local tinted = color.tint('#ff0000', 2)

-- Blend two colors (alpha 0-1)
local blended = color.blend('#ff0000', '#0000ff', 0.5)
```

## Custom Highlights

You can customize highlight groups in two ways:

### Via Theme File

```lua
local my_theme = {
  name = 'my_theme',
  -- ... colors ...
  groups = {
    MyCustomGroup = { fg = '#ff0000', bold = true },
    AnotherGroup = { link = 'Function' }
  }
}
```

### Via Config

```lua
require('base46').setup({
  colorscheme = 'my_theme',
  groups = {
    { name = 'MyCustomGroup', val = { fg = '#ff0000' } }
  }
})
```

## Telescope Picker

A telescope extension is included to quickly switch between themes:

```lua
-- After adding telescope and base46 to your plugins
require('telescope').load_extension('themes')

-- Open the theme picker
:Telescope themes
```

Make sure to populate the `themes` list in your setup:

```lua
require('base46').setup({
    colorscheme = 'default',
    themes = {'default', 'dracula', 'nord', 'one_light'}
})
```

## Treesitter Queries

Base46 includes treesitter queries for enhanced syntax highlighting in `after/queries/`:

- `c/` - C syntax highlighting
- `css/` - CSS syntax highlighting
- `lua/` - Lua syntax highlighting
- `markdown/` - Markdown (includes folds)
- `typescript/` - TypeScript syntax highlighting

These queries are loaded automatically when the colorscheme is applied.

## Credits

- [NvChad](https://github.com/NvChad/base46) - The original Base46 implementation
- [Base16](https://github.com/chriskempson/base16) - The base16 color scheme specification
