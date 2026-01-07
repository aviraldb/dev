
# --------------------------------------
# Zinit Plugin Manager Setup
# --------------------------------------

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# --------------------------------------
# Zinit Plugins (lazy loaded)
# --------------------------------------

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# OMZ snippets (only required ones)
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# Kubernetes-related snippets only if kubectl is installed
if command -v kubectl &>/dev/null; then
  zinit snippet OMZP::kubectl
  zinit snippet OMZP::kubectx
fi
