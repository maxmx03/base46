vim.api.nvim_create_user_command('Base46', function(args)
  require('base46.command').load(args.fargs[1], vim.list_slice(args.fargs, 2))
end, {
  nargs = '+',
  complete = function(arg)
    local list = require('base46.command').list()
    return vim.tbl_filter(function(s)
      return string.match(s, '^' .. arg)
    end, list)
  end,
})

vim.api.nvim_create_autocmd('OptionSet', {
  pattern = "background",
  callback = function()
    local config = require('base46').config
    if config.colorscheme and config.colorscheme ~= '' then
      vim.cmd.colorscheme(config.colorscheme)
    end
  end,
})
