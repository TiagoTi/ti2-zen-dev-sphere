#!/bin/zsh
set -x

# NCM - Neovim Config Manager

: "${NCM_BASE_DIR:=$HOME/.local/share/neovim_config_manager}"
: "${NCM_CURRENT_SHARE_LINK:=$HOME/.local/share/nvim}"
: "${NCM_CURRENT_CONFIG_LINK:=$HOME/.config/nvim}"


export NCM_RED="\033[0;31m"
export NCM_GREEN="\033[0;32m"
export NCM_RESET="\033[0m"

# Garantir que o diretório de configurações exista
mkdir -p "$NCM_BASE_DIR"

function neovim_config_manager_info () {
    echo 'neovim_config_manager_info'
    echo "NCM_BASE_DIR: $NCM_BASE_DIR"
    echo "NCM_CURRENT_SHARE_LINK: $NCM_CURRENT_SHARE_LINK"
    echo "NCM_CURRENT_CONFIG_LINK: $NCM_CURRENT_CONFIG_LINK"
}

function neovim_config_manager_list () {
    echo "Available configurations:"
    ls "$NCM_BASE_DIR"
}

function neovim_config_manager_use_version() {
    local version=$1
    echo "chose: $version"
    if [[ -z "$version" ]]; then
        echo -e "${NCM_RED}Usage: nvim-manager use <version-name>${NCM_RESET}"
        return 1
    fi

    if [[ "$version" == "default" ]]; then
      version="neovim-default-config"
    fi

    if [[ ! -d "$NCM_BASE_DIR/$version" ]]; then
      echo -e "${NCM_RED}Error: Configuration '$version' does not exist.${NCM_RESET}"
      return 1
    fi

    [[ -L "$NCM_CURRENT_CONFIG_LINK" ]] && rm "$NCM_CURRENT_CONFIG_LINK"
    [[ -L "$NCM_CURRENT_SHARE_LINK" ]] && rm "$NCM_CURRENT_SHARE_LINK"

   echo "$NCM_BASE_DIR/$version/config/nvim  --->  $NCM_CURRENT_CONFIG_LINK" 
   echo "$NCM_BASE_DIR/$version/share/nvim   --->  $NCM_CURRENT_SHARE_LINK" 
  
    ln -s "$NCM_BASE_DIR/$version/config/nvim" "$NCM_CURRENT_CONFIG_LINK" 
    ln -s "$NCM_BASE_DIR/$version/share/nvim" "$NCM_CURRENT_SHARE_LINK" 
    return 0
}

function neovim_config_manager() {
    case "$1" in
    use)
        echo 'using'
        neovim_config_manager_use_version $2
        ;;
    list)
        neovim_config_manager_list
        ;;
    info)
        neovim_config_manager_info
        ;;
    *)
    echo "Usage: neovim_config_manager <command> [args]"
    ;;
esac
}


alias ncm='neovim_config_manager'
