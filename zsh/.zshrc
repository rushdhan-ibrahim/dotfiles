# ══════════════════════════════════════════════════════════════════════════════
#                              PATH Configuration
# ══════════════════════════════════════════════════════════════════════════════
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/$USER/.local/bin:$PATH"
export PATH="$PATH:/Users/rush/AdmixTools/src"
export PATH="/Applications/plink_mac_20241022:$PATH"

# ══════════════════════════════════════════════════════════════════════════════
#                              Starship Prompt
# ══════════════════════════════════════════════════════════════════════════════
eval "$(starship init zsh)"

# ══════════════════════════════════════════════════════════════════════════════
#                              ZSH Plugins
# ══════════════════════════════════════════════════════════════════════════════
# Syntax highlighting - colors as you type
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions - ghost text from history
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ══════════════════════════════════════════════════════════════════════════════
#                              Better Defaults
# ══════════════════════════════════════════════════════════════════════════════
# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # Share history across sessions
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_VERIFY            # Show command before executing from history

# Directory navigation
setopt AUTO_CD                # cd into directory just by typing its name
setopt AUTO_PUSHD             # Push directories onto stack
setopt PUSHD_IGNORE_DUPS      # Don't push duplicates

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ══════════════════════════════════════════════════════════════════════════════
#                              Modern Aliases
# ══════════════════════════════════════════════════════════════════════════════
# eza - modern ls replacement
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=2 --icons -a'

# bat - modern cat replacement
alias cat='bat --style=auto'

# Useful shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias h='history'
alias reload='source ~/.zshrc'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -10'
alias gd='git diff'

# ══════════════════════════════════════════════════════════════════════════════
#                              Key Bindings
# ══════════════════════════════════════════════════════════════════════════════
# Accept autosuggestion with right arrow or Ctrl+E
bindkey '^e' autosuggest-accept
bindkey '^[[C' autosuggest-accept

# Search history with up/down arrows
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ══════════════════════════════════════════════════════════════════════════════
#                              Welcome Screen
# ══════════════════════════════════════════════════════════════════════════════
# Show neofetch on new terminal windows (skip in VS Code, scripts, etc.)
if [[ $- == *i* ]] && [[ -z "$VSCODE_INJECTION" ]] && [[ -z "$INSIDE_EMACS" ]]; then
    neofetch
fi
