if status is-interactive 

    # Git support:
    if not type -q git 
        set_color yellow
        echo "[WARNING] Git not available."
        echo "[WARNING] Please install git for your OS" 
        set_color normal 
    else 
        source $XDG_CONFIG_HOME/fish/modules/git.fish
    end

    # # SSH Persistance
    # if not set -q SSH_AUTH_SOCK
    #     eval (ssh-agent -c)
    # end

    # Zoxide support:
    if type -q zoxide
        zoxide init fish | source
    end

    # Fzf support:
    if type -q fzf
        fzf --fish | source
    end

    # Direnv support:
    if type -q direnv
        direnv hook fish | source
    end

    # mise support
    if type -q mise
        $HOME/.local/bin/mise activate fish | source
    end
end
