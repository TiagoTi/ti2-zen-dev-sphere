# Doc

req

  sudo apt install sqlite3 libsqlite3-dev git fd-find ripgrep

  https://github.com/nvim-treesitter/nvim-treesitter
  https://github.com/sharkdp/fd?tab=readme-ov-file#installation

## Namespaces

`mkdir -p namespaces/{buffer,windows,api,functions,commands,options,globals}`

```txt
Parece que você está explorando plugins do Neovim escritos em Lua. No contexto do Neovim, vim.o, vim.g, e outros similares são formas de acessar e definir diferentes tipos de configurações e variáveis globais. Vou explicar cada um:

    vim.o: Esta é uma interface para acessar ou definir opções que normalmente você ajustaria no Vim com comandos como :set. Por exemplo, vim.o.number = true no Lua é equivalente a :set number no Vimscript.

    vim.g: Isso se refere às variáveis globais do Vim. Você usaria vim.g para definir ou acessar variáveis que são comumente usadas por plugins ou configurações personalizadas. Por exemplo, vim.g.myvariable = 123 define uma variável global chamada myvariable com o valor 123.

Além destes, há outros "namespaces" similares no Neovim, incluindo:

    vim.bo e vim.wo: Estas são interfaces para opções de buffer (bo) e janela (wo), respectivamente. Elas funcionam de forma semelhante a vim.o, mas são específicas para buffers individuais ou janelas. Por exemplo, vim.wo.wrap = false desativa a quebra de linha para a janela atual.

    vim.api: Fornece acesso a várias funções da API do Neovim, que podem ser usadas para manipular o editor de maneiras mais complexas. Por exemplo, vim.api.nvim_set_var('myvar', 123) definiria uma variável global.

    vim.fn: Permite chamar funções internas do Vim. Por exemplo, vim.fn.getcwd() retornaria o diretório de trabalho atual.

    vim.cmd: Permite executar comandos do Vimscript. Por exemplo, vim.cmd('colorscheme desert') aplicaria o esquema de cores 'desert'.

Cada um desses "namespaces" fornece uma maneira de interagir com diferentes aspectos e configurações do Neovim, facilitando a personalização e o desenvolvimento de plugins em Lua.
```
