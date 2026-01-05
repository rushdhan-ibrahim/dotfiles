# ══════════════════════════════════════════════════════════════════════════════
#                              Shell Tools
#                         Atuin, Direnv, Mise integration
# ══════════════════════════════════════════════════════════════════════════════

# ══════════════════════════════════════════════════════════════════════════════
#                              Atuin (Shell History)
# ══════════════════════════════════════════════════════════════════════════════

if command -v atuin &>/dev/null; then
    # Initialize atuin
    eval "$(atuin init zsh --disable-up-arrow)"

    # Keybindings for atuin
    # Ctrl+R - search history (default)
    # Ctrl+H - search history (alternative)
    bindkey '^H' atuin-search

    # Up arrow still does regular history navigation
    # Use Ctrl+R for atuin's fuzzy search
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              Direnv (Per-directory Env)
# ══════════════════════════════════════════════════════════════════════════════

if command -v direnv &>/dev/null; then
    # Initialize direnv
    eval "$(direnv hook zsh)"

    # Silence direnv output (optional - comment out to see loading messages)
    # export DIRENV_LOG_FORMAT=""
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              Mise (Version Manager)
# ══════════════════════════════════════════════════════════════════════════════

if command -v mise &>/dev/null; then
    # Initialize mise
    eval "$(mise activate zsh)"

    # Aliases for mise
    alias mi="mise install"
    alias mu="mise use"
    alias ml="mise list"
    alias mr="mise run"
    alias mx="mise exec"
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              Tool Aliases
# ══════════════════════════════════════════════════════════════════════════════

# Quick project setup aliases
alias venv="python3 -m venv .venv && source .venv/bin/activate"
alias activate="source .venv/bin/activate 2>/dev/null || source venv/bin/activate"
alias deact="deactivate"

# Node version switching (if mise is available)
if command -v mise &>/dev/null; then
    alias node18="mise use node@18"
    alias node20="mise use node@20"
    alias node22="mise use node@22"
    alias nodelts="mise use node@lts"
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              Helper Functions
# ══════════════════════════════════════════════════════════════════════════════

# Create and enter a new project directory with optional tool setup
mkproject() {
    local name="$1"
    local type="${2:-}"

    if [[ -z "$name" ]]; then
        echo "Usage: mkproject <name> [python|node|go]"
        return 1
    fi

    mkdir -p "$name" && cd "$name" || return 1

    case "$type" in
        python|py)
            python3 -m venv .venv
            echo 'layout python' > .envrc
            direnv allow 2>/dev/null
            echo "Python project created with virtualenv"
            ;;
        node|js)
            npm init -y 2>/dev/null
            echo 'layout node' > .envrc
            direnv allow 2>/dev/null
            echo "Node.js project created"
            ;;
        go)
            go mod init "$name" 2>/dev/null
            echo 'layout go' > .envrc
            direnv allow 2>/dev/null
            echo "Go project created"
            ;;
        *)
            echo "Project directory created: $name"
            ;;
    esac
}

# Show current tool versions
versions() {
    echo "Tool versions:"
    command -v node &>/dev/null && echo "  Node: $(node --version)"
    command -v python3 &>/dev/null && echo "  Python: $(python3 --version 2>&1 | cut -d' ' -f2)"
    command -v go &>/dev/null && echo "  Go: $(go version | cut -d' ' -f3)"
    command -v ruby &>/dev/null && echo "  Ruby: $(ruby --version | cut -d' ' -f2)"
    command -v rustc &>/dev/null && echo "  Rust: $(rustc --version | cut -d' ' -f2)"
}
