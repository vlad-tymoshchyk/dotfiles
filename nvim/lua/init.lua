vim.g.mapleader = ','

require 'globals' -- `globals` uses plenary plugin
R 'plugins'
R 'options'
R 'keymaps'

R 'plugin_custom.addFinalChar'
R 'plugin_custom.switchToAlternative'

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
