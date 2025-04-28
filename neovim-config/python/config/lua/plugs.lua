local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('dense-analysis/ale')
Plug('diepm/vim-rest-console')
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('nvim-telescope/telescope.nvim', { ['tag'] ='0.1.6' })
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-lua/plenary.nvim')
Plug('preservim/nerdtree')
Plug('https://tpope.io/vim/fugitive.git')
vim.call('plug#end')
