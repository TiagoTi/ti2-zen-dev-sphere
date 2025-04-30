#!/bin/zsh
# set -x

# NCM - Neovim Config Manager

NCM_PROGRAM_NAME="ncm"
NCM_PROGRAM_VERSION="1.0.0"

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
    echo "Available configurations:\n"
    # ls --format=vertical "$NCM_BASE_DIR"
    ls "$NCM_BASE_DIR"| sort | pr -T -w 65  -2
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

   echo "ln -s $NCM_BASE_DIR/$version/config $NCM_CURRENT_CONFIG_LINK" 
   echo "ln -s $NCM_BASE_DIR/$version/share  $NCM_CURRENT_SHARE_LINK" 
  
    ln -s "$NCM_BASE_DIR/$version/config" "$NCM_CURRENT_CONFIG_LINK" 
    ln -s "$NCM_BASE_DIR/$version/share" "$NCM_CURRENT_SHARE_LINK" 
    return 0
}

function neovim_config_manager() {
    case "$1" in
    use | u)
        neovim_config_manager_use_version $2
        ;;
    list | ls)
        neovim_config_manager_list
        ;;
    info | i)
        neovim_config_manager_info
        ;;
    help | h)
        neovim_config_manager_show_help
        ;;
    version | v)
        neovim_config_manager_show_version
        ;;
    *)
    neovim_config_manager_show_help
    ;;
esac
}
function neovim_config_manager_show_version() {
  echo "$NCM_PROGRAM_NAME version $NCM_PROGRAM_VERSION"
}


function neovim_config_manager_show_help() {
  cat <<EOF
Usage: $NCM_PROGRAM_NAME [COMMAND] [ARGS...]

Neovim Config Manager - manage different Neovim configurations.

Commands:
  use, u <version>     Use the specified configuration
  list, l              List available configurations
  help, h              Show this help message
  info, i              Show informations about config
  version, v           Show version information

EOF
neovim_config_manager_show_version
}


alias ncm='neovim_config_manager'
neovim_config_manager