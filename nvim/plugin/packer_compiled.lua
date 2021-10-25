-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vtymoshchyk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vtymoshchyk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vtymoshchyk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vtymoshchyk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vtymoshchyk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  gruvbox = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gruvbuddy.nvim"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nQ\0\1\4\0\5\0\n6\1\0\0\18\3\0\0B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\3\0019\3\4\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire\6PÞ\2\1\0\t\0\24\0%6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0055\a\n\0B\5\2\2=\5\f\0049\5\b\0009\5\r\0055\a\16\0009\b\14\0009\b\15\b=\b\17\aB\5\2\2=\5\18\4=\4\b\0039\4\19\0009\4\20\0044\6\3\0005\a\21\0>\a\1\0065\a\22\0>\a\2\6B\4\2\2=\4\20\0035\4\23\0>\4\1\3B\1\2\1K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<C-n>\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_option\bapi\bvimÔ\n\1\2\v\0(\0o3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b \0'\t!\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\"\0'\t#\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b$\0'\t%\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b&\0'\t'\0\18\n\4\0B\5\5\0012\0\0€K\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0â\1\1\0\5\0\14\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0023\1\a\0006\2\0\0'\4\b\0B\2\2\0029\2\t\0029\2\n\0025\4\v\0=\0\f\4=\1\r\4B\2\2\1K\0\1\0\14on_attach\17capabilities\1\0\0\nsetup\rtsserver\14lspconfig\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-reload"] = {
    config = { "\27LJ\2\n^\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0024\1\3\0006\2\3\0'\3\4\0&\2\3\2>\2\1\1=\1\2\0K\0\1\0\6/\rNVIM_DIR\20lua_reload_dirs\16nvim-reload\frequire\0" },
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n…\2\0\0\v\0\16\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\14\0005\4\5\0005\5\v\0004\6\3\0005\a\6\0\18\b\0\0'\n\a\0B\b\2\2=\b\b\a>\a\1\0065\a\t\0\18\b\0\0'\n\n\0B\b\2\2=\b\b\a>\a\2\6=\6\f\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\tview\1\0\0\rmappings\tlist\1\0\0\vdir_up\1\0\1\bkey\6U\acb\15close_node\1\0\1\bkey\6x\1\0\1\tside\nright\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\në\1\0\0\t\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\t\0005\4\a\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\5=\5\b\4=\4\n\0035\4\f\0005\5\v\0=\5\r\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\rdefaults\1\0\0\18layout_config\15horizontal\1\0\0\1\0\1\20prompt_position\vbottom\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\22telescope.actions\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  vim = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/vtymoshchyk/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_option\bapi\bvimÔ\n\1\2\v\0(\0o3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b \0'\t!\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\"\0'\t#\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b$\0'\t%\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b&\0'\t'\0\18\n\4\0B\5\5\0012\0\0€K\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0â\1\1\0\5\0\14\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0023\1\a\0006\2\0\0'\4\b\0B\2\2\0029\2\t\0029\2\n\0025\4\v\0=\0\f\4=\1\r\4B\2\2\1K\0\1\0\14on_attach\17capabilities\1\0\0\nsetup\rtsserver\14lspconfig\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n…\2\0\0\v\0\16\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\14\0005\4\5\0005\5\v\0004\6\3\0005\a\6\0\18\b\0\0'\n\a\0B\b\2\2=\b\b\a>\a\1\0065\a\t\0\18\b\0\0'\n\n\0B\b\2\2=\b\b\a>\a\2\6=\6\f\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\tview\1\0\0\rmappings\tlist\1\0\0\vdir_up\1\0\1\bkey\6U\acb\15close_node\1\0\1\bkey\6x\1\0\1\tside\nright\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\në\1\0\0\t\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\t\0005\4\a\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\5=\5\b\4=\4\n\0035\4\f\0005\5\v\0=\5\r\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\rdefaults\1\0\0\18layout_config\15horizontal\1\0\0\1\0\1\20prompt_position\vbottom\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\22telescope.actions\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-reload
time([[Config for nvim-reload]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0024\1\3\0006\2\3\0'\3\4\0&\2\3\2>\2\1\1=\1\2\0K\0\1\0\6/\rNVIM_DIR\20lua_reload_dirs\16nvim-reload\frequire\0", "config", "nvim-reload")
time([[Config for nvim-reload]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nQ\0\1\4\0\5\0\n6\1\0\0\18\3\0\0B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\3\0019\3\4\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire\6PÞ\2\1\0\t\0\24\0%6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0055\a\n\0B\5\2\2=\5\f\0049\5\b\0009\5\r\0055\a\16\0009\b\14\0009\b\15\b=\b\17\aB\5\2\2=\5\18\4=\4\b\0039\4\19\0009\4\20\0044\6\3\0005\a\21\0>\a\1\0065\a\22\0>\a\2\6B\4\2\2=\4\20\0035\4\23\0>\4\1\3B\1\2\1K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<C-n>\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
