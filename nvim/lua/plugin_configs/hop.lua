local hop_config = function()
  require'hop'.setup{
    keys = 'aoeuidhtns-\',pyfgcrl;jkxbmwvz'
  }

  vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require'hop'.hint_char1()<cr>", {})
  vim.api.nvim_set_keymap('n', '-k', "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
  vim.api.nvim_set_keymap('n', '-j', "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
end

return hop_config
