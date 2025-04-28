local vim = vim

-- https://tuckerchapman.com/
local Mapping = {
    i = {
        ["<C-a>"] = {
            "<ESC>^i",
            "Begin of line"
        },
        ["<C-b>"] = { "<ESC>^i", "Begin of line" },
        ["<down>"] = {
            "<NOP>", "É uma abreviação de 'No Operation'.", { noremap = true }
        },                                                                                    -- disable arrow keys (vim muscle memory): 	inoremap <down> <NOP>
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
        ["<leader>n"] = { ":set number! relativenumber! <CR>", "toggle number" },                            --" map <leader>n :set nonumber<CR>
        ["<leader>s"] = { "<cmd> source % <CR>", "source current file" },
        ["<leader>w"] = { ":w<CR>", "Clear write current buffer - same up" },                                --" map <leader>w :w<CR>
        ["<leader><leader>"] = { ":source $MYVIMRC<CR>", "reload vim/neovim config" },
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
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["<"] = { "<gv", "Indent line" },
        [">"] = { ">gv", "Indent line" },
    },

    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
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


-- Define module
local M = {}

-- print hellow world
function M.PrintHelloWorld()
    print("Hello World")
end




-- -- Set a global environment variable
_G.my_mapping_loaded = true

-- -- Create a mapping to the PrintHelloWorld function
vim.api.nvim_set_keymap('n', '<leader>ph', ':lua require("mapping").PrintHelloWorld()<CR>', { noremap = true, silent = true })

-- -- Define a Neovim command that calls PrintHelloWorld
vim.api.nvim_create_user_command('PrtHello', M.PrintHelloWorld, {})

return M
