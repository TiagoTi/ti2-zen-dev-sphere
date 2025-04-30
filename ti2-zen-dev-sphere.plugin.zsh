#!/bin/zsh
NVIM_BASE=~/.oh-my-zsh/custom/plugins/ti2-zen-dev-sphere

local PLUGIN_NAME=ti2-zen-dev-sphere
local PLUGIN_PATH="$ZSH_CUSTOM/plugins/$PLUGIN_NAME"


function create-config-link() {
  echo "Iniciando link para: $1 em .config/nvim"
  # Define o caminho do diretório alvo
  targetDir="$HOME/.config/nvim"

  # Define o caminho do link simbólico
  linkTarget="$1/config"

    # Verifica se o diretório alvo existe
    if [[ -e $targetDir ]]; then
        # Verifica se é um link simbólico
        if [[ -L $targetDir ]]; then
            # Remove o link simbólico existente
            rm $targetDir
        else
            # Remove o diretório se não for um link
            rm -rf $targetDir
        fi
    fi
    # Cria um novo link simbólico
    ln -s $linkTarget $targetDir
}

function create-shared-link() {
  echo "Iniciando link para: $1 em .local/share/nvim"

  # Define o caminho do diretório alvo
  targetDir="$HOME/.local/share/nvim"
  rm -rf $targetDir; echo "Validando $targetDir"
  echo "Define o caminho do diretório alvo: $targetDir"

  # Define o caminho do link simbólico
  linkTarget="$1/share"

    # Verifica se o diretório alvo existe
    if [[ -e $targetDir ]]; then
        
        # Verifica se é um link simbólico
        # if [[ -L $targetDir ]]; then
        #     # Remove o link simbólico existente
        #     echo "existe link $targetDir"
        #     rm $targetDir
        # fi
        # if [[ -d $targetDir ]]; then
        #     # Remove o diretório se não for um link
        #     echo "existe dir $targetDir"
        #     rm -rf $targetDir
        # fi
    fi
    # Cria um novo link simbólico
    ln -s $linkTarget $targetDir
}


function nvim-change() {
    # Listar diretórios, cada diretório é um conjunto de configurações para os diretórios do neovim
    local dirs=($NVIM_BASE/nvim-configs/*(N/))
    # Mostrar opções e capturar a escolha do usuário
    select dir in "${dirs[@]}"; do
        if [ -n "$dir" ]; then
            echo "Pasta escolhida: $(basename $dir)"
            create-config-link $dir
            create-shared-link $dir
            break
        else
            echo "Escolha inválida, tente novamente."
        fi
    done
}

tmuxConfig () {
    touch ~/.tmux.conf
    cat $NVIM_BASE/tmux-config/.tmux.conf >  ~/.tmux.conf
}
gitIgnore() {
    if [[ ! -f $(pwd)/.dev/.gitignore ]]; then
        touch  $(pwd)/.dev/.gitignore
        echo ".dev/" >> $(pwd)/.dev/.gitignore
        echo ".dotenv" >> $(pwd)/.dev/.gitignore
        echo ".tool-versions" >> $(pwd)/.dev/.gitignore
        git config --local core.excludesfile .dev/.gitignore
    fi
}

create-dot-dev() {
    if [[ ! -d $(pwd)/.dev ]]; then
        mkdir -p $(pwd)/.dev
    fi
    gitIgnore
}

go-tool() {
    # Install debuger
    tmp=$GOFLAGS
    GOFLAGS=''
    go install github.com/go-delve/delve/cmd/dlv@latest 
    go install golang.org/x/lint/golint@latest
    go install golang.org/x/tools/gopls@latest
    GOFLAGS=$tmp
}


function nvim-local() {
  set +x
  local directory="$(pwd)"

  ls -la $HOME/.config/nvim | grep -o -e '-> /.*config$' | grep -o '/.*'     > $directory/.dev/nvim/old.txt
  ls -la $HOME/.local/share/nvim | grep -o -e '-> /.*share$' | grep -o '/.*' >> $directory/.dev/nvim/old.txt
  ln -sf $directory/.dev/nvim/config/nvim $HOME/.config/
  ln -sf $directory/.dev/nvim/share/nvim "$HOME/.local/share/"
  set -x
}

function oi () {
  echo 'oi'
}



echo "PLUGIN_NAME $PLUGIN_NAME"
echo "PLUGIN_PATH $PLUGIN_PATH"
source "$PLUGIN_PATH/neovim-config-manager.zsh"

alias update='sudo apt update -y && sudo apt upgrade -y --allow-downgrades && sudo apt clean -y && sudo apt autoclean -y && sudo apt autoremove -y'
