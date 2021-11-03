HOME = require('os').getenv('HOME')
NVIM_DIR = HOME .. '/dotfiles/nvim'
package.path = package.path .. ";" .. NVIM_DIR .. "/?.lua"

-- vim.lsp.set_log_level("debug")

-- dofile(HOME .. "/.local/share/nvim/site/pack/packer/start/packer.nvim/lua/packer.lua")

require 'options'
require 'plugins'
require 'keymaps'

require 'plugin_custom.addFinalChar'
require 'plugin_custom.switchToAlternative'

os.execute("mkdir -p ~/test/lua-vim && touch ~/test/lua-vim/main.lua")

vim.cmd [[
	autocmd BufWritePost ~/test/lua-vim/*.lua :luafile ~/test/lua-vim/main.lua

	colorscheme dracula

	" command! Conf source ~/.vimrc
	command! Vimrc tabe ~/.vimrc
	command! Vvimrc vs ~/.vimrc
	command! Luainit tabe ~/dotfiles/nvim/init.lua
	command! Vluainit vs ~/dotfiles/nvim/init.lua
	command! Zshrc tabe ~/.zshrc
	command! Vzshrc vs ~/.zshrc
	command! Delete call delete(expand('%')) | bdelete!

	autocmd BufWritePost *.{js,ts,jsx,tsx,css,scss} :PrettierAsync
	autocmd BufWritePost */.vimrc :Conf
	autocmd BufWritePre *.go :GoImports
	" autocmd BufWritePost ~/dotfiles/config/nvim/init.lua :luafile ~/dotfiles/config/nvim/init.lua

	" autocmd BufWritePost ~/dotfiles/nvim/*.lua :PackerCompile | PackerInstall
]]
