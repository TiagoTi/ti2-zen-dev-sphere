-- vim.bo.formatoptions = 'jnqlr'
local vim = vim
vim.o.compatible = false -- disable compatibility to old-time vi
vim.o.exrc = true        -- extend config with first of: .vim.lua, .nvimrc .exrc
vim.o.secure = true

vim.cmd [[filetype plugin indent on]] -- ativa ident de arquivo, carregamento de plugn e indent dára para fazer cada um deles separado
vim.cmd [[syntax enable]]
vim.g.mapleader = " "
vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "120,160"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.incsearch = true
-- vim.o.mouse = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmatch = true
vim.o.showmode = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.wildmode = "longest:list" -- get bash-like tab completions

-- This unsets the "last search pattern" register by hitting return
-- https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/

require('plugs')
require('mapping')


vim.g.NERDTreeShowHidden=1

