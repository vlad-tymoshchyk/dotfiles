local nvim_cmp_config = function()
  local cmp = require'cmp'
  local lspkind = require'lspkind'
  lspkind.init()

  cmp.setup({
      snippet = {
        expand = function(args)
          -- P(args)
          -- require('luasnip').lsp_expand(args.body)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      },
      sources = cmp.config.sources({
          { name = 'nvim_lsp', max_item_count = 10 },
          { name = 'nvim_lua', max_item_count = 10 },
          { name = 'path' },
          -- { name = 'luasnip' },
          { name = 'ultisnips', max_item_count = 5 },
          { name = 'buffer', max_item_count = 10 },
        }),
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
            -- luasnip = "[snip]",
            ultisnips = "[snippet]",
          },
        },
      }
    })
end

return nvim_cmp_config
