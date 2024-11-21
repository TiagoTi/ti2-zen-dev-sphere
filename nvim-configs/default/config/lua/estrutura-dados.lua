-- vim.bo.formatoptions = 'jnqlr'

local function run_c()
    -- current c file
    local source = vim.fn.expand('%:p')
    -- obtem o nome do arquivo atual sem a extenção
    local filename = vim.fn.expand('%:p:r')
    print(source, filename)
    -- salva o arquivos
    vim.cmd('write')
    -- compila e executa
    vim.cmd('!gcc ' .. source ..' -o ' .. filename .. ' && ' ..filename)
end
vim.api.nvim_create_autocmd("FileType" , {
    pattern = {'c', },
    callback = function()
        vim.keymap.set('n', '<Leader>c', run_c, {buffer=true})
    end
}
)


local function run_lua()
    -- current c file
    local source = vim.fn.expand('%:p')
    -- compila e executa
    vim.cmd('!lua ' .. source)
end
vim.api.nvim_create_autocmd("FileType" , {
    pattern = {'lua', },
    callback = function()
        vim.keymap.set('n', '<Leader>c', run_lua, {buffer=true})
    end
}
)

local function run_java()
    -- get current dir
    local src = vim.fn.expand('%:h')
    -- compila
    local javac = '!find ' .. src .. ' -name "*.java" -print | xargs javac'

    -- run
    local filename = vim.fn.expand('%:t:r')
    local run = javac .. ' && java ' .. filename
    vim.cmd(run)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = 'java',
    callback = function ()
        vim.keymap.set('n', '<Leader>c', run_java, {buffer=true})
    end
})
