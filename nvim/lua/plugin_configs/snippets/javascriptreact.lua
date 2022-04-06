local javascript_snippets = R('plugin_configs.snippets.javascript')
local ls = require'luasnip'
local s = ls.s
local i = ls.insert_node
local fmt = require'luasnip.extras.fmt'.fmt
local rep = require'luasnip.extras'.rep

local javascriptreact_snippets = {}

vim.list_extend(javascriptreact_snippets, javascript_snippets);

return javascriptreact_snippets
