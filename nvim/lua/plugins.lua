local telescope_config = R'plugin_configs.telescope'
-- local nvim_tree_config = require'plugin_configs.nvim_tree'
local lsp_config = require'plugin_configs.nvim_lspconfig'
local nvim_cmp_config = require'plugin_configs.nvim_cmp'
-- local nvim_reload_config = require'plugin_configs.nvim_reload'
local lualine_config = R'plugin_configs.lualine'
local neoscroll_config = R'plugin_configs.neoscroll'
local prettier_config = R'plugin_configs.prettier'

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim-plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'williamboman/nvim-lsp-installer'
-- Plug 'kyazdani42/nvim-tree.lua'
-- Plug 'famiu/nvim-reload'
Plug 'nvim-telescope/telescope.nvim'
--
Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'L3MON4D3/LuaSnip'
-- Plug 'rafamadriz/friendly-snippets'

Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
-- Plug 'saadparwaiz1/cmp_luasnip'

Plug 'fatih/vim-go'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-projectionist'
-- Plug 'vim-airline/vim-airline'
-- Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
-- Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
-- Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'rcarriga/nvim-notify'
-- Plug 'tjdevries/colorbuddy.nvim'
-- Plug 'tjdevries/gruvbuddy.nvim'

-- Plug ('neoclide/coc.nvim', { branch = 'release', ['do'] = 'yarn install --frozen-lockfile' })

Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSupdate' })
Plug 'nvim-treesitter/playground'

Plug 'nvim-lualine/lualine.nvim'
Plug 'karb94/neoscroll.nvim'

Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua'

-- Plug 'wbthomason/packer.nvim'

vim.call('plug#end')

-- require('packer').startup(function(use)
  -- use 'wbthomason/packer.nvim'
  -- use {
  --   "AckslD/nvim-neoclip.lua",
  --   requires = {'tami5/sqlite.lua', module = 'sqlite'},
  --   config = function()
  --     require('neoclip').setup()
  --   end,
  -- }
-- end)

telescope_config()
lsp_config()
nvim_cmp_config()
lualine_config()
neoscroll_config()
prettier_config()

local neoclip_config = function()
  require('neoclip').setup({
      history = 1000,
      enable_persistant_history = false,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      default_register = '"',
      content_spec_column = false,
      on_paste = {
        set_reg = false,
      },
      keys = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
          custom = {},
        },
        n = {
          select = '<cr>',
          paste = 'p',
          paste_behind = 'P',
          custom = {},
        },
      },
    })
end

neoclip_config()

require'telescope'.load_extension'neoclip'
