ZDOTDIR="$HOME/.config/zsh"

# Sourcing all Modules
source "$ZDOTDIR/plugins.zsh" # First

source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/completions.zsh"
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/extra.zsh"
source "$ZDOTDIR/hist.zsh"
source "$ZDOTDIR/options.zsh"
source "$SECRETS_DIR/zsh/env.zsh"

source "$ZDOTDIR/shellIntegration.zsh" # last
