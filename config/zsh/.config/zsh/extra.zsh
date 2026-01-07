# --------------------------------------
# Optional Extras
# --------------------------------------

# Background fastfetch (only outside tmux)
if [[ -z "$TMUX" && -f "$HOME/.config/fastfetch" ]]; then
  (fastfetch &)
fi
