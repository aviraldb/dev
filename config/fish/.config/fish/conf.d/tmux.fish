function _fish_tmux_sessioner
    set -l sessions (tmux list-sessions -F "#S" 2>/dev/null)
    set -l choice \
        (printf '%s\n' $sessions "PRESET" "NEW" | fzf --prompt="Tmux Session: ")

    # be explicit about fzf's exit status too (130 on ctrl-c/esc),
    # rather than relying only on empty output
    if test $status -ne 0; or test -z "$choice"
        return
    end

    if test "$choice" = "NEW"
        read -l -P "Session Name: " name
        if test $status -ne 0
            # ctrl-c or ctrl-d during read -> abort, don't fall back
            return
        end
        if test -z "$name"
            set name (date +"session-%H%M%S")
        end
        if set -q TMUX
            tmux new-session -d -s "$name"
            tmux switch-client -t "$name"
        else
            tmux new-session -s "$name"
        end
    else if test "$choice" = "PRESET"
        if test -x $HOME/.config/tmux/scripts/preset_sessions.sh
            $HOME/.config/tmux/scripts/preset_sessions.sh
        else
            notify-send "preset_sessions scripts either not exist or not an executable"
        end
    else
        if set -q TMUX
            tmux switch-client -t "$choice"
        else
            tmux attach -t "$choice"
        end
    end
end

if status is-interactive
    and type -q tmux
    and not set -q TMUX

    if type -q fzf
        bind -M insert \ef _fish_tmux_sessioner
        bind -M default \ef _fish_tmux_sessioner
    end
end
