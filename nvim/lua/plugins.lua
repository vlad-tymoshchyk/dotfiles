local telescope_config = R'plugin_configs.telescope'
-- local nvim_tree_config = require'plugin_configs.nvim_tree'
local lsp_config = require'plugin_configs.nvim_lspconfig'
-- local nvim_cmp_config = require'plugin_configs.nvim_cmp'
-- local nvim_reload_config = require'plugin_configs.nvim_reload'

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim-plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'williamboman/nvim-lsp-installer'
-- Plug 'kyazdani42/nvim-tree.lua'
-- Plug 'hrsh7th/nvim-cmp'
-- Plug 'famiu/nvim-reload'
Plug 'nvim-telescope/telescope.nvim'
--
Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'L3MON4D3/LuaSnip'
-- Plug 'rafamadriz/friendly-snippets'

-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'hrsh7th/cmp-nvim-lua'
-- Plug 'saadparwaiz1/cmp_luasnip'

Plug 'fatih/vim-go'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
-- Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
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
Plug ('nvim-treesitter/playground')

vim.call('plug#end')

telescope_config()
lsp_config()
