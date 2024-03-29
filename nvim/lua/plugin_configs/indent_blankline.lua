local indent_blankline_config = function()
  vim.opt.list = true
  vim.opt.listchars:append("eol:↴")
  require'indent_blankline'.setup{
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true
  }
end

return indent_blankline_config
