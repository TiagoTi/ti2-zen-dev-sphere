local vim = vim
local Plug = vim.fn['plug#']

vim.o.exrc = true        -- extend config with first of: .vim.lua, .nvimrc .exrc
vim.o.compatible = false -- disable compatibility to old-time vi
vim.g.mapleader = ","
--
vim.cmd [[filetype plugin indent on]] -- ativa ident de arquivo, carregamento de plugn e indent dára para fazer cada um deles separado
vim.cmd("colorscheme  industry")
vim.cmd [[syntax enable]]

-- vim.cmd [[filetype plugin indent on]] -- ativa ident de arquivo, carregamento de plugn e indent dára para fazer cada um deles separado
-- vim.cmd [[syntax enable]]
-- vim.o.autoindent = true
-- vim.o.clipboard = "unnamedplus"
-- vim.o.colorcolumn = "120,180"
-- vim.o.cursorline = true
-- vim.o.expandtab = true
-- vim.o.hlsearch = true
-- vim.o.incsearch = true
-- vim.o.mouse = true
-- vim.o.number = true
-- vim.o.relativenumber = true
-- vim.o.showmatch = true
-- vim.o.showmode = true
-- vim.o.softtabstop = 4
-- vim.o.tabstop = 4
-- vim.o.wildmode = "longest:list" -- get bash-like tab completions
--[[
" " This unsets the "last search pattern" register by hitting return
" " https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/
"
]]
--


-- https://tuckerchapman.com/
local Mapping = {
    i = {
        -- ["<C-a>"] = { "<ESC>^i", "Begin of line" },
        -- ["<C-b>"] = { "<ESC>^i", "Begin of line" },
        ["<down>"] = { "<NOP>", "É uma abreviação de 'No Operation'.", { noremap = true } },                                                                                    -- disable arrow keys (vim muscle memory): 	inoremap <down> <NOP>
        ["<left>"] = { "<NOP>", "É uma abreviação de 'No Operation'.", { noremap = true } },  -- disable arrow keys (vim muscle memory): 	inoremap <left> <NOP>
        ["<right>"] = { "<NOP>", "É uma abreviação de 'No Operation'.", { noremap = true } }, -- disable arrow keys (vim muscle memory): 	inoremap <right> <NOP>
        ["<up>"] = { "<NOP>", "É uma abreviação de 'No Operation'.", { noremap = true } },    -- disable arrow keys (vim muscle memory):  inoremap <up> <NOP>
    },

    n = {
        ["<C-h>"] = { "<C-w>h", "Shortcuts for split navigation left" },                                     -- Shortcuts for split navigation: map <C-h> <C-w>h
        ["<C-j>"] = { "<C-w>j", "Shortcuts for split navigation down" },                                     -- Shortcuts for split navigation: map <C-j> <C-w>j
        ["<C-k>"] = { "<C-w>k", "Shortcuts for split navigation up" },                                       -- Shortcuts for split navigation: map <C-k> <C-w>k
        ["<C-l>"] = { "<C-w>l", "Shortcuts for split navigation right" },                                    -- Shortcuts for split navigation: map <C-l> <C-w>l
        ["<ESC>"] = { "<cmd> noh <CR>", "Clear highlights" },
        -- ["<leader>n"] = { ":set number! relativenumber! <CR>", "toggle number" },                            --" map <leader>n :set nonumber<CR>
        -- ["<leader>s"] = { "<cmd> source % <CR>", "source current file" },
        -- ["<leader>w"] = { ":w<CR>", "Clear write current buffer - same up" },                                --" map <leader>w :w<CR>
        -- ["<leader><leader>"] = { ":source $MYVIMRC<CR>", "reload vim/neovim config" },
        ["<C-a>"] = { ":NERDTreeToggle<CR>", "open/close nerdtree" }, -- "map <leader>t :call ToggleConfig()<CR>
        ["<leader>t"] = { ":NERDTreeToggle<CR>", "open/close nerdtree" }, -- "map <leader>t :call ToggleConfig()<CR>
        ["ç"] = { ":", "entra no modo de comando" },                                                         -- "enable ç to enter in command mode: :map ç :
        ['<down>'] = { function() vim.api.nvim_err_writeln("Umm, use j instead") end, { noremap = true } },  -- disable arrow keys (vim muscle memory): noremap <down> :echoerr "Umm, use j instead"<CR>
        ['<left>'] = { function() vim.api.nvim_err_writeln("Umm, use h instead") end, { noremap = true } },  -- disable arrow keys (vim muscle memory): noremap <left> :echoerr "Umm, use h instead"<CR>
        ['<right>'] = { function() vim.api.nvim_err_writeln("Umm, use l instead") end, { noremap = true } }, -- disable arrow keys (vim muscle memory): noremap <right> :echoerr "Umm, use l instead"<CR>
        ['<up>'] = { function() vim.api.nvim_err_writeln("Umm, use k instead") end, { noremap = true } },    -- disable arrow keys (vim muscle memory): noremap <up> :echoerr "Umm, use k instead"<CR>
    },

    t = {
        ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    },

    v = {
        -- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        -- ["<"] = { "<gv", "Indent line" },
        -- [">"] = { ">gv", "Indent line" },
    },

    x = {
      -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
      -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
      -- ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    },
}
-- Iterando sobre a tabela Mapping
for modo, mapeamentos in pairs(Mapping) do
    -- print("Modo:", modo)

    -- Iterando sobre os mapeamentos dentro de cada modo
    for tecla, acao in pairs(mapeamentos) do
        local comando = acao[1]
        local descricao = acao[2]
        local opts = acao.opts ~= nil
        -- print("Tecla:", tecla, "Comando:", comando, "Descrição:", descricao, "Tem opts:", opts)

        if (opts)
        then
            vim.keymap.set(modo, tecla, comando, acao.opts)
        else
            vim.keymap.set(modo, tecla, comando, { noremap = true })
        end
    end
end

-- require('estrutura-dados')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "olrtg/emmet-language-server"
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
  }
}, {})

-- -- Dev Version
-- -- Plug('/home/tiago/tmp/nvim-many-project/ti2.vim')
-- -- Plug('diepm/vim-rest-console')
-- Plug()
-- Plug('preservim/nerdtree')
-- Plug('nvim-lua/plenary.nvim')
-- Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
-- vim.call('plug#end')
