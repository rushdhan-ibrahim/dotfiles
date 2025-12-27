#!/bin/bash
# Dotfiles installation script

set -e

echo "Installing dotfiles..."

# Install Homebrew packages
echo "Installing packages..."
brew install starship eza bat neofetch 2>/dev/null || true
brew install zsh-autosuggestions zsh-syntax-highlighting 2>/dev/null || true
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || true

# Create directories
mkdir -p ~/.config
mkdir -p ~/.claude

# Backup existing configs
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
[ -f ~/.config/starship.toml ] && mv ~/.config/starship.toml ~/.config/starship.toml.backup

# Symlink configs
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES/neofetch" ~/.config/neofetch
ln -sf "$DOTFILES/claude-code/settings.json" ~/.claude/settings.json
ln -sf "$DOTFILES/claude-code/statusline.sh" ~/.claude/statusline.sh
chmod +x ~/.claude/statusline.sh

echo ""
echo "Dotfiles installed!"
echo ""
echo "Manual steps:"
echo "1. Open iTerm > Settings > Profiles > Colors > Color Presets > Import"
echo "   Select: $DOTFILES/iterm/claude-theme.itermcolors"
echo ""
echo "2. Set font: Settings > Profiles > Text > Font"
echo "   Select: JetBrainsMono Nerd Font (14pt)"
echo ""
echo "3. Restart iTerm"
