-- vim-bootstrap 2024-03-19 21:12:20

-- *****************************************************************************
-- Vim-Plug core
-- *****************************************************************************
local vimplug_exists = vim.fn.expand('~/./autoload/plug.vim')
local curl_exists
if vim.fn.has('win32') and not vim.fn.has('win64') then
    curl_exists = vim.fn.expand('C:\\Windows\\Sysnative\\curl.exe')
else
    curl_exists = vim.fn.expand('curl')
end

vim.g.vim_bootstrap_langs = "go"
vim.g.vim_bootstrap_editor = "" -- nvim or vim
vim.g.vim_bootstrap_theme = "dracula"
vim.g.vim_bootstrap_frams = ""

if vim.fn.filereadable(vimplug_exists) == 0 then
    if vim.fn.executable(curl_exists) == 0 then
        vim.api.nvim_err_writeln("You have to install curl or first install vim-plug yourself!")
        vim.cmd("q!")
    end
    print("Installing Vim-Plug...")
    print("")
    vim.fn.system("! " .. curl_exists .. " -fLo " .. vim.fn.shellescape(vimplug_exists) .. " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
    vim.g.not_finish_vimplug = "yes"

    vim.cmd("autocmd VimEnter * PlugInstall")
end

-- Required:
vim.fn["plug#begin"](vim.fn.expand('~/./plugged'))

-- *****************************************************************************
-- Plug install packages
-- *****************************************************************************
vim.fn["plug#"]( 'scrooloose/nerdtree' )
vim.fn["plug#"]( 'jistr/vim-nerdtree-tabs' )
vim.fn["plug#"]( 'tpope/vim-commentary' )
vim.fn["plug#"]( 'tpope/vim-fugitive' )
vim.fn["plug#"]( 'vim-airline/vim-airline' )
vim.fn["plug#"]( 'vim-airline/vim-airline-themes' )
vim.fn["plug#"]( 'airblade/vim-gitgutter' )
vim.fn["plug#"]( 'vim-scripts/grep.vim' )
vim.fn["plug#"]( 'vim-scripts/CSApprox' )
vim.fn["plug#"]( 'Raimondi/delimitMate' )
vim.fn["plug#"]( 'majutsushi/tagbar' )
vim.fn["plug#"]( 'dense-analysis/ale' )
vim.fn["plug#"]( 'Yggdroot/indentLine' )
vim.fn["plug#"]( 'editor-bootstrap/vim-bootstrap-updater' )
vim.fn["plug#"]( 'tpope/vim-rhubarb' ) -- required by fugitive to :GBrowse
vim.fn["plug#"]( 'dracula/vim', { 'as': 'dracula' } )

if vim.fn.isdirectory('/usr/local/opt/fzf') then
    vim.fn["plug#"]( '/usr/local/opt/fzf' )
    vim.fn["plug#"]( 'junegunn/fzf.vim' )
else
    vim.fn["plug#"]( 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } )
    vim.fn["plug#"]( 'junegunn/fzf.vim' )
end
local make = 'gmake'
if vim.fn.exists('make') then
    make = 'make'
end
vim.fn["plug#"]( 'Shougo/vimproc.vim', {'do': make} )

-- Vim-Session
vim.fn["plug#"]( 'xolox/vim-misc' )
vim.fn["plug#"]( 'xolox/vim-session' )

-- Snippets
vim.fn["plug#"]( 'SirVer/ultisnips' )
vim.fn["plug#"]( 'honza/vim-snippets' )

-- *****************************************************************************
-- Custom bundles
-- *****************************************************************************

-- go
-- Go Lang Bundle
vim.fn["plug#"]( 'fatih/vim-go', {'do': ':GoInstallBinaries'} )

-- *****************************************************************************
-- *****************************************************************************

-- Include user's extra bundle
if vim.fn.filereadable(vim.fn.expand("~/.rc.local.bundles")) then
    vim.cmd("source ~/.rc.local.bundles")
end

vim.fn["plug#end"]()

-- Required:
vim.cmd("filetype plugin indent on")

-- *****************************************************************************
-- Basic Setup
-- *****************************************************************************

-- Encoding
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.o.ttyfast = true

-- Fix backspace indent
vim.o.backspace = "indent,eol,start"

-- Tabs. May be overridden by autocmd rules
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Map leader to ,
vim.g.mapleader = ','

-- Enable hidden buffers
vim.o.hidden = true

-- Searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.fileformats = "unix,dos,mac"

if vim.fn.exists('$SHELL') then
    vim.o.shell = "$SHELL"
else
    vim.o.shell = "/bin/sh"
end

-- session management
vim.g.session_directory = "~/./session"
vim.g.session_autoload = "no"
vim.g.session_autosave = "no"
vim.g.session_command_aliases = 1

-- *****************************************************************************
-- Visual Settings
-- *****************************************************************************
vim.cmd("syntax on")
vim.o.ruler = true
vim.o.number = true

vim.g.no_buffers_menu = 1
vim.g.dracula_colorterm = 0
vim.cmd("colorscheme dracula")

-- Better command line completion
vim.o.wildmenu = true

-- mouse support
vim.o.mouse = "a"
vim.o.mousemodel = "popup"
vim.o.t_Co = 256
vim.o.guioptions = "egmrti"
vim.o.gfn = "Monospace\\ 10"

if vim.fn.has("gui_running") then
    if vim.fn.has("gui_mac") or vim.fn.has("gui_macvim") then
        vim.o.guifont = "Menlo:h12"
        vim.o.transparency = 7
    end
else
    vim.g.CSApprox_loaded = 1

    -- IndentLine
    vim.g.indentLine_enabled = 1
    vim.g.indentLine_concealcursor = ''
    vim.g.indentLine_char = '┆'
    vim.g.indentLine_faster = 1

    if os.getenv("COLORTERM") == 'gnome-terminal' then
        vim.o.term = 'gnome-256color'
    else
        if os.getenv("TERM") == 'xterm' then
            vim.o.term = 'xterm-256color'
        end
    end
end

if vim.o.term:match('256color') then
    vim.o.t_ut = ''
end

-- Disable the blinking cursor.
vim.o.gcr = "a:blinkon0"

vim.o.scrolloff = 3

-- Status bar
vim.o.laststatus = 2

-- Use modeline overrides
vim.o.modeline = true
vim.o.modelines = 10

vim.o.title = true
vim.o.titleold = "Terminal"
vim.o.titlestring = "%F"

vim.o.statusline = "%F%m%r%h%w%=(%{&ff}/%Y)\\ (line\\ %l\\/%L,\\ col\\ %c)\\ "

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

if vim.fn.exists("*fugitive#statusline") then
    vim.o.statusline = vim.o.statusline .. "%{fugitive#statusline()}"
end

-- vim-airline
vim.g.airline_theme = 'powerlineish'
vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tagbar#enabled'] = 1
vim.g.airline_skip_empty_sections = 1

-- *****************************************************************************
-- Abbreviations
-- *****************************************************************************
-- no one is really happy until you have this shortcuts
vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qall qall")

-- NERDTree configuration
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeIgnore = {'node_modules','\\.rbc$','\\~$','\\.pyc$','\\.db$','\\.sqlite$','__pycache__'}
vim.g.NERDTreeSortOrder = {'^__\\.py$','\\/\\$','*','\\.swp$','\\.bak$','\\~$'}
vim.g.NERDTreeShowBookmarks = 1
vim.g.nerdtree_tabs_focus_on_files = 1
vim.g.NERDTreeMapOpenInTabSilent = '<RightMouse>'
vim.g.NERDTreeWinSize = 50
vim.o.wildignore = vim.o.wildignore .. '*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/'
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeFind<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle<CR>', { silent = true })

-- grep.vim
vim.api.nvim_set_keymap('n', '<leader>f', ':Rgrep<CR>', { silent = true })
vim.g.Grep_Default_Options = '-IR'
vim.g.Grep_Skip_Files = '*.log *.db'
vim.g.Grep_Skip_Dirs = '.git node_modules'

-- terminal emulation
vim.api.nvim_set_keymap('n', '<leader>sh', ':terminal<CR>', { silent = true })

-- *****************************************************************************
-- Commands
-- *****************************************************************************
-- remove trailing whitespaces
vim.cmd("command! FixWhitespace :%s/\\s\\+$//e")

-- *****************************************************************************
-- Functions
-- *****************************************************************************
local function setup_wrapping()
    vim.opt.wrap = true
    vim.opt.wm = 2
    vim.opt.textwidth = 79
end

if not vim.fn.exists('*s:setupWrapping') then
    _G.s.setupWrapping = setup_wrapping
end

-- *****************************************************************************
-- Autocmd Rules
-- *****************************************************************************
-- The PC is fast enough, do syntax highlight syncing from start unless 200 lines
vim.cmd("augroup vimrc-sync-fromstart")
vim.cmd("autocmd!")
vim.cmd("autocmd BufEnter * :syntax sync maxlines=200")
vim.cmd("augroup END")

-- Remember cursor position
vim.cmd("augroup vimrc-remember-cursor-position")
vim.cmd("autocmd!")
vim.cmd("autocmd BufReadPost * if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"$\") | exe \"normal! g`\\\"\" | endif")
vim.cmd("augroup END")

-- txt
vim.cmd("augroup vimrc-wrapping")
vim.cmd("autocmd!")
vim.cmd("autocmd BufRead,BufNewFile *.txt call v:lua.setup_wrapping()")
vim.cmd("augroup END")

-- make/cmake
vim.cmd("augroup vimrc-make-cmake")
vim.cmd("autocmd!")
vim.cmd("autocmd FileType make setlocal noexpandtab")
vim.cmd("autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake")
vim.cmd("augroup END")

vim.opt.autoread = true

-- *****************************************************************************
-- Mappings
-- *****************************************************************************
-- Split
vim.api.nvim_set_keymap('', '<Leader>h', ':<C-u>split<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>v', ':<C-u>vsplit<CR>', { silent = true })

-- Git
vim.api.nvim_set_keymap('', '<Leader>ga', ':Gwrite<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gc', ':Git commit --verbose<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gsh', ':Git push<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gll', ':Git pull<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gs', ':Git<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gb', ':Git blame<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gd', ':Gvdiffsplit<CR>', { silent = true })
vim.api.nvim_set_keymap('', '<Leader>gr', ':GRemove<CR>', { silent = true })

-- session management
vim.api.nvim_set_keymap('n', '<leader>so', ':OpenSession<Space>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ss', ':SaveSession<Space>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', ':DeleteSession<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>sc', ':CloseSession<CR>', { silent = true })

-- Tabs
vim.api.nvim_set_keymap('n', '<Tab>', 'gt', { silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', { silent = true })
vim.api.nvim_set_keymap('n', '<S-t>', ':tabnew<CR>', { silent = true })

-- Set working directory
vim.api.nvim_set_keymap('n', '<leader>.', ':lcd %:p:h<CR>', { silent = true })

-- Opens an edit command with the path of the currently edited file filled in
vim.api.nvim_set_keymap('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', { silent = true })

-- Opens a tab edit command with the path of the currently edited file filled
vim.api.nvim_set_keymap('n', '<Leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', { silent = true })

-- fzf.vim
vim.opt.wildmode:append { 'list:longest', 'list:full' }
vim.opt.wildignore:append { '*.o', '*.obj', '.git', '*.rbc', '*.pyc', '__pycache__' }
vim.g['$FZF_DEFAULT_COMMAND'] = "find * -path '*/\\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

-- The Silver Searcher
if vim.fn.executable('ag') then
    vim.g['$FZF_DEFAULT_COMMAND'] = 'ag --hidden --ignore .git -g ""'
    vim.o.grepprg = 'ag --nogroup --nocolor'
end

-- ripgrep
if vim.fn.executable('rg') then
    vim.g['$FZF_DEFAULT_COMMAND'] = 'rg --files --hidden --follow --glob "!.git/*"'
    vim.o.grepprg = 'rg --vimgrep'
    vim.cmd([[command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)]])
end

vim.cmd("cnoremap <C-P> <C-R>=expand('%:p:h') . '/' <CR>")
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':FZF -m<CR>', { silent = true })
-- Recovery commands from history through FZF
vim.api.nvim_set_keymap('n', '<leader>y', ':History:<CR>', { silent = true })

-- snippets
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-b>"
vim.g.UltiSnipsEditSplit = "vertical"

-- ale
vim.g.ale_linters = {}

-- Tagbar
vim.api.nvim_set_keymap('n', '<F4>', ':TagbarToggle<CR>', { silent = true })
vim.g.tagbar_autofocus = 1

-- Disable visualbell
vim.o.errorbells = false
vim.o.visualbell = false
vim.opt.titlestring = "Terminal"

-- Copy/Paste/Cut
if vim.fn.has('unnamedplus') then
    vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
end

vim.api.nvim_set_keymap('n', 'YY', '"+y<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+gP<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'XX', '"+x<CR>', { noremap = true })

if vim.fn.has('macunix') then
    -- pbcopy for OSX copy/paste
    vim.api.nvim_set_keymap('v', '<C-x>', ':!pbcopy<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', '<C-c>', ':w !pbcopy<CR><CR>', { noremap = true })
end

-- Buffer nav
vim.api.nvim_set_keymap('n', '<leader>z', ':bp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':bp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':bn<CR>', { silent = true })

-- Close buffer
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { silent = true })

-- Clean search (highlight)
vim.api.nvim_set_keymap('n', '<silent> <leader><space>', ':noh<cr>', { silent = true })

-- Switching windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })

-- Vmap for maintain Visual Mode after shifting > and <
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- Move visual block
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Open current line on GitHub
vim.api.nvim_set_keymap('n', '<Leader>o', ':.GBrowse<CR>', { silent = true })

-- *****************************************************************************
-- Custom configs
-- *****************************************************************************
-- go
-- vim-go
-- run :GoBuild or :GoTestCompile based on the go file
function build_go_files()
    local file = vim.fn.expand('%')
    if file:match('^%f+_test%.go$') then
        vim.cmd("call go#test#Test(0, 1)")
    elseif file:match('^%f+%.go$') then
        vim.cmd("call go#cmd#Build(0)")
    end
end

vim.api.nvim_set_keymap('n', '<leader>gb', ':lua build_go_files()<CR>', { silent = true })
-- *****************************************************************************
