
# --------------------------------------
# Aliases
# --------------------------------------

# Common Aliases
alias vim='nvim'
alias v='nvim'
alias c='clear'
alias e='exit'
alias t='tmux'
alias nf='fastfetch'
alias ff='fastfetch'

# Git Aliases
alias lg='lazygit'
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gaa='git add .'
alias gc='git commit'
# alias gp='git push'
# alias gu='git pull'
alias gcl='git clone'
alias gl='git log --graph --all --decorate --date=iso --pretty=format:"%C(auto)%h%Creset %C(bold blue)(%ad)%Creset %C(yellow)%d%Creset%n%C(bold green)Author:%Creset %an <%ae>%n%C(bold red)Committer:%Creset %cn <%ce>%n%C(bold cyan)Message:%Creset %s%n"'

# Extra QoL
alias technoblade='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rs $(pacman -Qdtq) && echo "killed all orphans" || echo "no orphans to kill nerd"'
# alias ~='cd ~'

# Conditional Aliases
if command -v zoxide >/dev/null 2>&1; then
    alias cd='z'
fi

if command -v exa >/dev/null 2>&1; then
    alias ls='exa -lah'
    alias ll='ls'
else
    alias ls='ls -lart'
fi
alias nano='nvim'
