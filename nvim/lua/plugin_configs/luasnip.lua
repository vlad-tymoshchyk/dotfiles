function luasnip_config()
  local ls = require'luasnip'
  local s = ls.snippet
  local types = require'luasnip.util.types'

  ls.config.set_config {
    history = true,
    updateevents = "textchanged,textchangedi",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<-", "error" } },
        }
      }
    }
  }

  vim.keymap.set({ "i", "s" }, "<c-t>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end)
  vim.keymap.set({ "i", "s" }, "<a-t>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end)
  vim.keymap.set({ "i", "s" }, "<c-u>", require'luasnip.extras.select_choice')
  vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)



  local ls = require'luasnip'
  local s = ls.s
  local i = ls.insert_node
  local c = ls.choice_node
  local t = ls.text_node
  local f = ls.function_node
  local fmt = require'luasnip.extras.fmt'.fmt
  local rep = require'luasnip.extras'.rep

  local last_import = function(index)
    return f(function(arg)
      local input = arg[1][1]

      return string.gmatch(input .. "-", "[^.]+$")()
    end, { index })
end

ls.snippets = {
  javascript = R'plugin_configs.snippets.javascript',
  javascriptreact = R'plugin_configs.snippets.javascriptreact',
  typescript = R'plugin_configs.snippets.typescript',
  typescriptreact = R'plugin_configs.snippets.typescriptreact',
  lua = {
    s("req", fmt("local {} = require'{}'", { last_import(1), i(1) }))
    -- s("des", fmt("describe('{}', {} ({}) => {{\n{}\n}})", { 
    --       c(1, {
    --           t"Some here",
    --           t"Another",
    --           t"",
    --         }),
    --       i(2),
    --       i(3),
    --       c(4, {
    --           t"it('test', () => {{}})",
    --           t"",
    --         })
    --   }))
  }
}
end

function luasnip_config_error()
  print("Version is too low for snips -", vim.version().minor)
end

if vim.version().minor >= 7 then
  return luasnip_config
else
  return luasnip_config_error
end
