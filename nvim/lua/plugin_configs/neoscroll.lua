local neoscroll_config = function()
  require('neoscroll').setup({
      -- Set any options as needed
    })

  local t = {}
  -- Syntax: t[keys] = {function, {function arguments}}
  t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
  t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
  t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '200'}}
  t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200'}}
  t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
  t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
  t['zt']    = {'zt', {'50'}}
  t['zz']    = {'zz', {'50'}}
  t['zb']    = {'zb', {'50'}}

  require('neoscroll.config').set_mappings(t)
end

return neoscroll_config
