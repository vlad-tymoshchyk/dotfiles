local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim-plugged')
Plug 'nvim-lua/plenary.nvim'
vim.call('plug#end')

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

_M = {}
