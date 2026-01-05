# ══════════════════════════════════════════════════════════════════════════════
#                              ZSH Configuration
#                    Optimized for speed and productivity
# ══════════════════════════════════════════════════════════════════════════════
# Performance target: <100ms startup time
# Profile with: time zsh -i -c exit
# Debug with: zmodload zsh/zprof && zprof

# Define dotfiles location
DOTFILES="$HOME/dotfiles"
ZSH_LIB="$DOTFILES/zsh/lib"

# ══════════════════════════════════════════════════════════════════════════════
#                              Zinit Plugin Manager
# ══════════════════════════════════════════════════════════════════════════════

# Install zinit if not present
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
    print -P "%F{#d4a27f}Installing zinit...%f"
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" 2>/dev/null
fi
source "${ZINIT_HOME}/zinit.zsh"

# ══════════════════════════════════════════════════════════════════════════════
#                              Core Modules (Sync)
# ══════════════════════════════════════════════════════════════════════════════

# Load essential configs immediately
[[ -f "$ZSH_LIB/options.zsh" ]] && source "$ZSH_LIB/options.zsh"
[[ -f "$ZSH_LIB/keybindings.zsh" ]] && source "$ZSH_LIB/keybindings.zsh"

# ══════════════════════════════════════════════════════════════════════════════
#                              Prompt (Load Early)
# ══════════════════════════════════════════════════════════════════════════════

# Starship prompt - loads fast, needs to be early
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              Plugins (Lazy Loaded)
# ══════════════════════════════════════════════════════════════════════════════

# Syntax highlighting - load with turbo mode (defer)
zinit ice wait lucid atinit"zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

# Autosuggestions - load with turbo mode
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Configure autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#625e5a'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Completions from zsh-users (turbo mode)
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# ══════════════════════════════════════════════════════════════════════════════
#                              Deferred Modules
# ══════════════════════════════════════════════════════════════════════════════

# Load completions after prompt
zinit ice wait'0' lucid
zinit snippet "$ZSH_LIB/completions.zsh"

# Load aliases
zinit ice wait'0' lucid
zinit snippet "$ZSH_LIB/aliases.zsh"

# Load functions
zinit ice wait'0' lucid
zinit snippet "$ZSH_LIB/functions.zsh"

# Load FZF config
zinit ice wait'0' lucid
zinit snippet "$ZSH_LIB/fzf.zsh"

# Load zoxide
zinit ice wait'0' lucid
zinit snippet "$ZSH_LIB/zoxide.zsh"

# Load shell tools (atuin, direnv, mise)
zinit ice wait'0' lucid
zinit snippet "$ZSH_LIB/tools.zsh"

# ══════════════════════════════════════════════════════════════════════════════
#                              Welcome Screen
# ══════════════════════════════════════════════════════════════════════════════

# Show neofetch on new terminal windows (skip in VS Code, scripts, non-interactive)
if [[ -o interactive ]] && [[ -z "$VSCODE_INJECTION" ]] && [[ -z "$INSIDE_EMACS" ]] && [[ -z "$TERM_PROGRAM_VERSION" ]]; then
    if command -v neofetch &>/dev/null; then
        neofetch
    fi
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              Compile for Speed
# ══════════════════════════════════════════════════════════════════════════════

# Recompile zshrc if it changed (background, silent)
{
    local zshrc="$HOME/.zshrc"
    if [[ ! -f "${zshrc}.zwc" ]] || [[ "$zshrc" -nt "${zshrc}.zwc" ]]; then
        zcompile "$zshrc" 2>/dev/null
    fi
} &!
