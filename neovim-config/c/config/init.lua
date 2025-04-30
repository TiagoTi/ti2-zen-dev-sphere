-- nvim-configs/c
local vim = vim
local Plug = vim.fn['plug#']
vim.o.exrc = true

vim.call('plug#begin')
Plug('diepm/vim-rest-console')
Plug('dense-analysis/ale')
Plug('terroo/vim-simple-emoji')
Plug('matsuuu/pinkmare')
Plug('preservim/nerdtree')
Plug('nvim-lua/plenary.nvim')
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
vim.call('plug#end')

vim.cmd([[
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number!                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=180                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
set syntax=ON                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set title
set encoding=utf-8

set termguicolors
colorscheme pinkmare

map q :q<CR>
map <C-s> :w<CR>

]])

