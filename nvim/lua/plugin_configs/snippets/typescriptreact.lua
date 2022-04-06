local typescript_snippets = R('plugin_configs.snippets.typescript')
local ls = require'luasnip'
local s = ls.s
local i = ls.insert_node
local fmt = require'luasnip.extras.fmt'.fmt
local rep = require'luasnip.extras'.rep

local typescriptreact_snippets = {}

vim.list_extend(typescriptreact_snippets, typescript_snippets);

return typescriptreact_snippets
