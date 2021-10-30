local telescope_config = require'plugin_configs.telescope'
local nvim_tree_config = require'plugin_configs.nvim_tree'
local lsp_config = require'plugin_configs.nvim_lspconfig'
local nvim_cmp_config = require'plugin_configs.nvim_cmp'
local nvim_reload_config = require'plugin_configs.nvim_reload'
local luasnip_config = require'plugin_configs.luasnip'

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'nvim-telescope/telescope.nvim', config = telescope_config }
  use { 'kyazdani42/nvim-tree.lua', config = nvim_tree_config }
  use { 'neovim/nvim-lspconfig', config = lsp_config }
  use { 'hrsh7th/nvim-cmp', config = nvim_cmp_config }
  use { 'famiu/nvim-reload', config = nvim_reload_config }
  use { 'L3MON4D3/LuaSnip', config = luasnip_config }

  use { 'nvim-treesitter/nvim-treesitter'  }
  use { 'nvim-lua/plenary.nvim'  }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'rafamadriz/friendly-snippets' }

  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'onsails/lspkind-nvim' }

  use { 'fatih/vim-go' }
  use { 'dracula/vim' }
  use { 'ryanoasis/vim-devicons' }
  -- use { 'sheerun/vim-polyglot' }
  -- use { 'tpope/vim-projectionist' }
  -- use { 'vim-airline/vim-airline' }
  -- use { 'w0rp/ale' }
  -- use { 'wellle/targets.vim' }
  -- use { 'SirVer/ultisnips' }
  use { 'airblade/vim-gitgutter' }
  use { 'easymotion/vim-easymotion' }
  use { 'editorconfig/editorconfig-vim' }
  -- use { 'honza/vim-snippets' }
  use { 'jiangmiao/auto-pairs' }
  use { 'mhinz/vim-startify' }
  use { 'morhetz/gruvbox' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-fugitive' }
  use { 'scrooloose/nerdcommenter' }
  use { 'prettier/vim-prettier' }
  use { 'rcarriga/nvim-notify' }
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'tjdevries/gruvbuddy.nvim' }

end)
