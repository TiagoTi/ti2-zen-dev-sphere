local vim          = vim
local Plug         = vim.fn['plug#']

vim.o.exrc         = true
vim.o.nocompatible = true     -- desativa compatibilidade com as versões legadas vi
vim.o.showmode     = true     -- Exibe o modo atual do neovim

vim.o.autoindent   = true     -- indent a new line the same amount as the line just typed
vim.o.cc           = 180      -- set an 80 column border for good coding style
vim.o.clipboard    = "unnamedplus" -- using system clipboard
vim.o.cursorline   = true     -- highlight current cursorline
vim.o.expandtab    = true     -- converts tabs to white space
vim.o.hlsearch     = true     -- highlight search
vim.o.incsearch    = true     -- incremental search
vim.o.mouse        = true     -- enable mouse click
vim.o.number       = true     -- add line numbers
vim.o.shiftwidth   = 4        -- width for autoindents
vim.o.showmatch    = true     -- show matching
vim.o.softtabstop  = 4        -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.tabstop      = 4        -- number of columns occupied by a tab
vim.o.wildmode     = "longest,list" -- get bash-like tab completions

vim.call('plug#begin')
-- Dev Version
Plug('dense-analysis/ale')
Plug('preservim/nerdtree')
Plug('nvim-lua/plenary.nvim')
Plug('diepm/vim-rest-console')
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
vim.call('plug#end')

vim.cmd([[

"filetype plugin indent on   " allow auto-indenting depending on file type
"filetype plugin on          " filetype plugin on

"syntax on                   " syntax highlighting

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
