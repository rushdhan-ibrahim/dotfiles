#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
#                         Dotfiles Installation Script
#                      Claude-themed terminal environment
# ══════════════════════════════════════════════════════════════════════════════

set -e

# Colors for output (Claude palette)
CORAL='\033[38;2;212;162;127m'
SAGE='\033[38;2;138;154;123m'
SAND='\033[38;2;196;178;138m'
RESET='\033[0m'

print_header() {
    echo -e "${CORAL}"
    echo "    ◠◡◠"
    echo "   (  ◡  )"
    echo "    ╲   ╱"
    echo ""
    echo "  Claude Dotfiles Installer"
    echo -e "${RESET}"
}

print_step() {
    echo -e "${SAND}▶${RESET} $1"
}

print_success() {
    echo -e "${SAGE}✓${RESET} $1"
}

print_header

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# ══════════════════════════════════════════════════════════════════════════════
#                              Install Packages
# ══════════════════════════════════════════════════════════════════════════════

print_step "Installing Homebrew packages..."

# Core tools
brew install starship eza bat neofetch 2>/dev/null || true

# Phase 1: Shell superpowers
brew install fzf fd ripgrep zoxide 2>/dev/null || true

# Phase 2: Neovim
brew install neovim 2>/dev/null || true

# Phase 3: Tmux
brew install tmux 2>/dev/null || true

# Phase 4: Terminal emulators (uncomment desired ones)
# brew install --cask alacritty 2>/dev/null || true
# brew install --cask kitty 2>/dev/null || true
# brew install --cask wezterm 2>/dev/null || true

# Optional enhancements
brew install git-delta lazygit btop dust duf 2>/dev/null || true

# Fonts
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || true

print_success "Packages installed"

# ══════════════════════════════════════════════════════════════════════════════
#                              Setup FZF
# ══════════════════════════════════════════════════════════════════════════════

print_step "Configuring FZF..."
if [[ -f /opt/homebrew/opt/fzf/install ]]; then
    /opt/homebrew/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish 2>/dev/null || true
fi
print_success "FZF configured"

# ══════════════════════════════════════════════════════════════════════════════
#                              Create Directories
# ══════════════════════════════════════════════════════════════════════════════

print_step "Creating directories..."
mkdir -p ~/.config
mkdir -p ~/.claude
mkdir -p ~/.cache/zsh
mkdir -p ~/.local/share
print_success "Directories created"

# ══════════════════════════════════════════════════════════════════════════════
#                              Backup Existing
# ══════════════════════════════════════════════════════════════════════════════

print_step "Backing up existing configs..."
backup_if_exists() {
    if [[ -f "$1" ]] && [[ ! -L "$1" ]]; then
        mv "$1" "$1.backup.$(date +%Y%m%d)"
        echo "  Backed up: $1"
    fi
}

backup_if_exists ~/.zshrc
backup_if_exists ~/.zshenv
backup_if_exists ~/.zprofile
backup_if_exists ~/.config/starship.toml

backup_dir_if_exists() {
    if [[ -d "$1" ]] && [[ ! -L "$1" ]]; then
        mv "$1" "$1.backup.$(date +%Y%m%d)"
        echo "  Backed up: $1"
    fi
}
backup_dir_if_exists ~/.config/nvim
backup_dir_if_exists ~/.config/tmux
backup_if_exists ~/.tmux.conf
backup_dir_if_exists ~/.config/alacritty
backup_dir_if_exists ~/.config/kitty
backup_dir_if_exists ~/.config/wezterm
backup_if_exists ~/.wezterm.lua
backup_if_exists ~/.gitconfig
backup_if_exists ~/.gitignore_global
backup_dir_if_exists ~/.config/lazygit
print_success "Backups complete"

# ══════════════════════════════════════════════════════════════════════════════
#                              Symlink Configs
# ══════════════════════════════════════════════════════════════════════════════

print_step "Creating symlinks..."

# ZSH configs
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/zsh/.zshenv" ~/.zshenv
ln -sf "$DOTFILES/zsh/.zprofile" ~/.zprofile

# Starship
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml

# Neofetch
ln -sfn "$DOTFILES/neofetch" ~/.config/neofetch

# Neovim
ln -sfn "$DOTFILES/nvim" ~/.config/nvim

# Tmux
mkdir -p ~/.config/tmux
ln -sf "$DOTFILES/tmux/tmux.conf" ~/.tmux.conf
ln -sfn "$DOTFILES/tmux/themes" ~/.config/tmux/themes

# Install TPM (Tmux Plugin Manager)
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    print_step "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2>/dev/null || true
    print_success "TPM installed"
fi

# Terminal emulators (Phase 4)
ln -sfn "$DOTFILES/alacritty" ~/.config/alacritty
ln -sfn "$DOTFILES/kitty" ~/.config/kitty
ln -sfn "$DOTFILES/wezterm" ~/.config/wezterm
ln -sf "$DOTFILES/wezterm/wezterm.lua" ~/.wezterm.lua

# Git (Phase 5)
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/git/.gitignore_global" ~/.gitignore_global
mkdir -p ~/.config/lazygit
ln -sf "$DOTFILES/lazygit/config.yml" ~/.config/lazygit/config.yml

# Claude Code
ln -sf "$DOTFILES/claude-code/settings.json" ~/.claude/settings.json
ln -sf "$DOTFILES/claude-code/statusline.sh" ~/.claude/statusline.sh
chmod +x ~/.claude/statusline.sh

print_success "Symlinks created"

# ══════════════════════════════════════════════════════════════════════════════
#                              Final Steps
# ══════════════════════════════════════════════════════════════════════════════

echo ""
echo -e "${SAGE}════════════════════════════════════════════════════════════════${RESET}"
echo -e "${CORAL}  Installation complete!${RESET}"
echo -e "${SAGE}════════════════════════════════════════════════════════════════${RESET}"
echo ""
echo "Manual steps:"
echo ""
echo -e "${SAND}1.${RESET} Import iTerm color theme:"
echo "   iTerm > Settings > Profiles > Colors > Color Presets > Import"
echo "   Select: $DOTFILES/iterm/claude-theme.itermcolors"
echo ""
echo -e "${SAND}2.${RESET} Set font:"
echo "   iTerm > Settings > Profiles > Text > Font"
echo "   Select: JetBrainsMono Nerd Font (14pt)"
echo ""
echo -e "${SAND}3.${RESET} Restart your terminal or run: source ~/.zshrc"
echo ""
echo "Phase 1 - Shell Features:"
echo "  • Ctrl+R  - Fuzzy history search"
echo "  • Ctrl+T  - Fuzzy file finder"
echo "  • Alt+C   - Fuzzy cd to directory"
echo "  • z <dir> - Smart directory jumping (zoxide)"
echo ""
echo "Phase 2 - Neovim Features:"
echo "  • Space   - Leader key"
echo "  • <leader>ff - Find files"
echo "  • <leader>fg - Live grep"
echo "  • <leader>e  - File explorer"
echo "  • <leader>gg - LazyGit"
echo "  • Run 'nvim' to start (plugins install on first launch)"
echo ""
echo "Phase 3 - Tmux Features:"
echo "  • C-a     - Prefix key (instead of C-b)"
echo "  • C-a |   - Split vertical"
echo "  • C-a -   - Split horizontal"
echo "  • C-a hjkl - Navigate panes"
echo "  • Run 'tmux' then 'C-a I' to install plugins"
echo ""
echo "Phase 4 - Terminal Emulators:"
echo "  Claude-themed configs available for:"
echo "  • Alacritty: GPU-accelerated, minimal"
echo "  • Kitty:     Feature-rich, GPU-rendered"
echo "  • WezTerm:   Lua-configurable, cross-platform"
echo "  To install: brew install --cask alacritty/kitty/wezterm"
echo ""
echo "Phase 5 - Git Workflow:"
echo "  • Delta:   Beautiful diffs with Claude theme"
echo "  • Lazygit: Git TUI (run 'lg' or 'lazygit')"
echo "  • Aliases: gs, gc, gp, gl, gd, and 50+ more"
echo "  • Run 'git aliases' to see all available"
echo ""
