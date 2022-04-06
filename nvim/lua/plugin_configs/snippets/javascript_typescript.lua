local ls = require'luasnip'
local s = ls.s
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local t = ls.text_node
local fmt = require'luasnip.extras.fmt'.fmt
local rep = require'luasnip.extras'.rep

local same = function(index)
  return f(function(arg)
    return arg[1][1]
  end, {index})
end

local javascript_typescript_snippets = {
  s("cl", fmt([[console.log({})]], { i(0) })),
  s("clg", fmt([[console.log('{}', {})]], { i(1), same(1) })),
}

return javascript_typescript_snippets
