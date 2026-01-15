# Detect OS type
detect_os() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo $ID
    elif [[ -f /etc/arch-release ]]; then
        echo "arch"
    else
        echo "unknown"
    fi
}

OS=$(detect_os)

# Common configuration for all systems
export EDITOR="vim"
export VISUAL="vim"

# OS-specific configurations
case $OS in
    arch)
        
        # Aliases
        alias search='yay -Ss'
        alias remove='yay -Rns'
        alias install='yay -S --noconfirm'
        alias update='yay -Syu --noconfirm'
        
        # PATH additions
        export PATH="$HOME/.local/bin:$PATH"
        
        ;;
        
    nixos)
        
        # Aliases
        alias update='sudo nixos-rebuild switch --flakes'
        alias install='nix-env -iA nixos.'
        alias search='nix search nixpkgs'
        alias upgrade='sudo nixos-rebuild switch --flakes --upgrade'
        
        # PATH
        export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"
        
        # Settings
        export NIX_PATH="$HOME/.nix-defexpr/channels:$NIX_PATH"
        ;;
        
    ubuntu|debian)
        
        # Debian-specific PATH additions
        export PATH="$HOME/.local/bin:$PATH"
        ;;
        
    *)
        echo "Unknown OS: $OS"
        ;;
esac
