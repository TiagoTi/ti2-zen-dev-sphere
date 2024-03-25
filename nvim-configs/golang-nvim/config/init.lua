-- nvim-configs/golang-nvim
vim.o.exrc = true
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

" Set multi leader map
let mapleader=","
map <leader>r :w<CR>
map <leader>w :w<CR>
map <leader>n :set nonumber<CR>
map <leader>h :noh<CR>
" This unsets the "last search pattern" register by hitting return
" https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/
]])

-- https://tuckerchapman.com/

-- *****************************************************************************
-- Vim-Plug core
-- *****************************************************************************
-- Ajuste para obter o diretório home
local home = os.getenv("HOME") or vim.fn.expand("~")

local curl = "curl"

-- Verificação da Existência do Vim-Plug
local vimplug_path = home .. "/.config/nvim/autoload/plug.vim"
local vimplug_exists = vim.fn.filereadable(vimplug_path)

if vimplug_exists == 0 then
  -- Verificação da Existência do Curl
    if vim.fn.executable(curl) == 0 then
      print("You have to install curl or first install vim-plug yourself!")
      vim.api.nvim_command("q!")
      return
    end

    vim.api.nvim_out_write("Installing Vim-Plug...")
    local curl_cmd = string.format("%s -fLo %s --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", curl, vim.fn.shellescape(vimplug_path))
    os.execute(curl_cmd)
    vim.g.not_finish_vimplug = "yes"
    vim.api.nvim_create_autocmd("VimEnter", { command = "PlugInstall" })
  else
    vim.api.nvim_out_write("You have plug.vim")
end


local vimplugged_path = home .. "/.local/share/nvim/plugged"
-- Required:
-- vim.call('plug#begin')
vim.fn["plug#begin"](vimplugged_path)
local Plug = vim.fn['plug#']
Plug( 'Raimondi/delimitMate' )
Plug( 'Yggdroot/indentLine' )
Plug( 'airblade/vim-gitgutter' )
Plug( 'dense-analysis/ale' )
vim.fn["plug#"]( 'dracula/vim', { 'as' , 'dracula' } )
Plug( 'editor-bootstrap/vim-bootstrap-updater' )
Plug( 'jistr/vim-nerdtree-tabs' )
Plug( 'majutsushi/tagbar' )
Plug( 'scrooloose/nerdtree' )
Plug( 'tpope/vim-commentary' )
Plug( 'tpope/vim-fugitive' )
Plug( 'tpope/vim-rhubarb' ) -- required by fugitive to :GBrowse
Plug( 'vim-airline/vim-airline' )
Plug( 'vim-airline/vim-airline-themes' )
Plug( 'vim-scripts/CSApprox' )
Plug( 'vim-scripts/grep.vim' )
if vim.fn.isdirectory('/usr/local/opt/fzf') or vim.fn.isdirectory('/usr/bin/fzf') then
    Plug( '/usr/local/opt/fzf' )
    Plug( 'junegunn/fzf.vim' )
else
    -- Plug( 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } )
    Plug('junegunn/fzf', {
        ['dir'] = '~/.fzf',
        ['do'] = './install --bin'
    })
    Plug( 'junegunn/fzf.vim' )
end
local make = 'gmake'
if vim.fn.exists('make') then
    make = 'make'
end
Plug( 'Shougo/vimproc.vim', {['do']= make} )
-- Vim-Session
Plug( 'xolox/vim-misc' )
Plug( 'xolox/vim-session' )
-- Snippets
Plug( 'SirVer/ultisnips' )
Plug( 'honza/vim-snippets' )
-- Custom bundles Go Lang Bundle
Plug( 'fatih/vim-go', {['do']= ':GoInstallBinaries'} )
vim.fn["plug#end"]()
