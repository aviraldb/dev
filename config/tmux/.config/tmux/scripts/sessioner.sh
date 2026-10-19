#!/usr/bin/env bash
set -uo pipefail
# Note: no -e here on purpose. fzf legitimately exits non-zero on
# Esc/Ctrl-C (130) or no-match (1), and under -e that would kill this
# script before we ever get a chance to check for cancellation below.

mapfile -t sessions < <(tmux list-sessions -F "#S" 2>/dev/null)

choice=$(printf '%s\n' "${sessions[@]}" "PRESET" "NEW" | fzf --prompt="Tmux Session: ")
fzf_status=$?

if [ "$fzf_status" -ne 0 ] || [ -z "$choice" ]; then
    exit 0
fi

# Check real sessions first so a session literally named
# "NEW" or "PRESET" doesn't get shadowed by the reserved words below.
is_existing_session=0
for s in "${sessions[@]}"; do
    if [ "$s" = "$choice" ]; then
        is_existing_session=1
        break
    fi
done

if [ "$is_existing_session" -eq 1 ]; then
    if [ -n "${TMUX:-}" ]; then
        tmux switch-client -t "$choice"
    else
        tmux attach -t "$choice"
    fi
    exit 0
fi

case "$choice" in
    NEW)
        read -r -p "Session Name: " name
        if [ -z "$name" ]; then
            name=$(date +"session-%H%M%S")
        fi
        if [ -n "${TMUX:-}" ]; then
            tmux new-session -d -s "$name"
            tmux switch-client -t "$name"
        else
            tmux new-session -s "$name"
        fi
        ;;
    PRESET)
        script="$HOME/.config/tmux/scripts/sessioner.sh"
        if [ -x "$script" ]; then
            "$script"
        else
            notify-send "sessioner scripts either not exist or not an executable"
        fi
        ;;
esac
