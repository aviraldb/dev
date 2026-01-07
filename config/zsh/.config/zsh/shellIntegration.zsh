
# --------------------------------------
# Prompt + Integrations
# --------------------------------------

# fzf integration (defer if possible)
if [[ -z "$FZF_COMPLETION_TRIGGER" ]]; then
    eval "$(fzf --zsh)"
fi

# Starship prompt (keep immediate for visible prompt)
eval "$(starship init zsh)"

# Zoxide integration (can defer slightly)
eval "$(zoxide init zsh)"
