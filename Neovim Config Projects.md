# Neovim Config Projects

## criando uma nova configuracao para o neovim

Na pasta `ti2-zen-dev-sphere/neovim-config`, branch main crie a pasta desejada
para conter as novas configurações
(neste exemplo  vamos criar uma configuração chamada tutorial)

```sh
git checkout main

mkdir -p neovim-config/tutorial/config
mkdir -p neovim-config/tutorial/share

touch neovim-config/tutorial/config/.gitkeep
touch neovim-config/tutorial/share/.gitkeep

git add neovim-config/tutorial
git commit -m 'commit initial commit Neovim Config Projects Tutorial'
```

Crie uma pasta de trabalho e uma branch especifica para a configuração

```sh
git checkout -b neovim-config-tutorial
git checkout main
mkdir -p ~/projects/neovim-config-tutorial
git worktree add ~/projects/neovim-config-tutorial neovim-config-tutorial

cd ~/projects/neovim-config-tutorial && git sparse-checkout set neovim-config/tutorial
```


