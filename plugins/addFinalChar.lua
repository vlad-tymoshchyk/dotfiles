local api = vim.api

function addFinalSymbol(sym, charToReplace)
  local row = api.nvim_win_get_cursor(0)[1]
  local line = api.nvim_get_current_line()

  if #line == 0 then
    return
  end

  local ch = line:sub(#line, #line + 1);

  if ch ~= sym then
    if charToReplace == ch then
      api.nvim_buf_set_text(0, row - 1, #line - 1, row - 1, #line, { sym });
    else
      api.nvim_buf_set_text(0, row - 1, #line - 1, row - 1, #line, { ch .. sym })
    end
  else
    api.nvim_buf_set_text(0, row - 1, #line - 1, row - 1, #line, { '' })
  end
end

vim.api.nvim_set_keymap('n', ',c;', [[<Cmd>lua addFinalSymbol(';', ',')<cr>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', ',c,', [[<Cmd>lua addFinalSymbol(',', ';')<cr>]], { noremap = true, silent = false })
