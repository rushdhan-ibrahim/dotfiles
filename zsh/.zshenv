# ══════════════════════════════════════════════════════════════════════════════
#                              Environment Variables
#                         (Loaded first, for all shells)
# ══════════════════════════════════════════════════════════════════════════════

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# PATH Configuration
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/AdmixTools/src"
export PATH="/Applications/plink_mac_20241022:$PATH"

# Default programs
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

# History file location
export HISTFILE="$HOME/.zsh_history"
