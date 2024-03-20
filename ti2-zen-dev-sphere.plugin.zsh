#!/bin/zsh

export NVIM_BASE=~/.oh-my-zsh/custom/plugins/ti2-zen-dev-sphere


function create-config-link() {
  echo "Iniciando link para: $1"
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
  echo "Iniciando link para: $1"
  # Define o caminho do diretório alvo
  targetDir="$HOME/.local/share/nvim"

  # Define o caminho do link simbólico
  linkTarget="$1/share"

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


function nvim-change() {
    # Listar diretórios
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

