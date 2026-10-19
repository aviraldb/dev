# XDG Standard directories
set -Ux XDG_CONFIG_HOME     $HOME/.config
set -Ux XDG_DATA_HOME       $HOME/.local/share
set -Ux XDG_STATE_HOME      $HOME/.local/state
set -Ux XDG_CACHE_HOME      $HOME/.cache

set -Ux SECRETS_DIR $HOME/.secrets/
set -Ux NOTES_DIR   $HOME/Notes/

set -Ux SHELL (which fish)
set -Ux EDITOR (which nvim)
set -gx BROWSER zen-browser

set -Ux GTK_IM_MODULE simple

set -gx NIX_BUILD_SHELL (which bash)
set -gx GPG_TTY (tty)
