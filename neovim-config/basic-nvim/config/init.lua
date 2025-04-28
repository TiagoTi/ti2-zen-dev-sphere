local vim = vim
local Plug = vim.fn['plug#']

vim.o.exrc = true

vim.call('plug#begin')
-- Dev Version
Plug('/home/tiago/tmp/nvim-many-project/ti2.vim')
Plug('diepm/vim-rest-console')
Plug('dense-analysis/ale')
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
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=180                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline

"Remaps
	" ativar e desativar visualização do nerdtree
		nmap <C-a> :NERDTreeToggle<CR>
	" Shortcuts for split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	"enable ç to enter in command mode
	:map ç :
	" disable arrow keys (vim muscle memory)
	noremap <up> :echoerr "Umm, use k instead"<CR>
	noremap <down> :echoerr "Umm, use j instead"<CR>
	noremap <left> :echoerr "Umm, use h instead"<CR>
	noremap <right> :echoerr "Umm, use l instead"<CR>
	inoremap <up> <NOP>
	inoremap <down> <NOP>
	inoremap <left> <NOP>
	inoremap <right> <NOP>
    "Show hidden files in NERDTRee
	let NERDTreeShowHidden=1
    " Set multi leader map
" let mapleader="-"
let mapleader=","
map <leader>r :w<CR>
map <leader>w :w<CR>
map <leader>n :set nonumber<CR>
"map <leader>t :call ToggleConfig()<CR>
map <leader>h :noh<CR>
" This unsets the "last search pattern" register by hitting return
" https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/

]])

-- https://tuckerchapman.com/
