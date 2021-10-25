local nvim_cmp_config = function()
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        P(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }),
    { name = 'buffer' },
  })
end

return nvim_cmp_config
