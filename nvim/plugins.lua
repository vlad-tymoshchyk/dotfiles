return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-lua/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup({
          defaults = {
            mappings = {
              i = {
                ["<esc>"] = require('telescope.actions').close,
              },
            },
            layout_config = {
              horizontal = {
                prompt_position = "bottom"
              }
            }
          },
        })
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      local tree_cb = require'nvim-tree.config'.nvim_tree_callback
      require'nvim-tree'.setup{
        view = {
          side = 'right',
          mappings = {
            list = {
              { key = "x", cb = tree_cb("close_node") },
              { key = "U", cb = tree_cb("dir_up") }
            }
          }
        }
      }
    end
  }

  use 'fatih/vim-go'
  use 'dracula/vim'
  use 'ryanoasis/vim-devicons'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-projectionist'
  use 'vim-airline/vim-airline'
  use 'w0rp/ale'
  use 'wellle/targets.vim'
  use 'SirVer/ultisnips'
  use 'airblade/vim-gitgutter'
  use 'easymotion/vim-easymotion'
  use 'editorconfig/editorconfig-vim'
  use 'honza/vim-snippets'
  use 'jiangmiao/auto-pairs'

  use 'mhinz/vim-startify'
  use 'morhetz/gruvbox'

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'

  use 'neovim/nvim-lspconfig'
  use 'scrooloose/nerdcommenter'
end);
