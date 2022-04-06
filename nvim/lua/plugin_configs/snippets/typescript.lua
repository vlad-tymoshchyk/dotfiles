local javascript_typescript_snippets = R('plugin_configs.snippets.javascript_typescript')
local ls = require'luasnip'
local s = ls.s
local i = ls.insert_node
local fmt = require'luasnip.extras.fmt'.fmt
local rep = require'luasnip.extras'.rep

local typescript_snippets = {}

vim.list_extend(typescript_snippets, javascript_typescript_snippets);

return typescript_snippets
