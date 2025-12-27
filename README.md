# Dotfiles

My personal terminal configuration featuring a custom **Claude/Anthropic-inspired theme** with warm, muted, earthy tones.

## Preview

```
            *                    
        *   |   *                
      *     |     *              
        \   |   /                
    *----\  |  /----*            
          \|||/                  
    *------(◡‿◡)------*          
          /|||\                  
    *----/  |  \----*            
        /   |   \                
      *     |     *              
        *   |   *                
            *                    
```
*Happy Claude flower greeting on terminal startup*

## Color Palette

A warm, muted palette inspired by Claude/Anthropic branding:

| Color | Hex | Usage |
|-------|-----|-------|
| Coral | `#d4a27f` | Primary accent, cursor, prompt |
| Terracotta | `#c4746e` | Errors, deletions |
| Sand | `#c4b28a` | Directories, secondary |
| Sage | `#8a9a7b` | Success, additions |
| Dusty Rose | `#a292a3` | Git status |
| Teal | `#8ea4a2` | Hostnames |
| Warm Gray | `#625e5a` | Muted text |
| Cream | `#e8dfd6` | Foreground |
| Dark Warm | `#1a1816` | Background |

## What's Included

### Zsh Configuration (`.zshrc`)
- **Starship prompt** - Fast, customizable prompt
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Syntax highlighting as you type
- **eza** - Modern `ls` replacement with icons
- **bat** - Modern `cat` with syntax highlighting
- Useful aliases and keybindings
- Neofetch welcome screen

### Starship Prompt (`starship.toml`)
- Claude-themed colors
- Git integration with branch and status
- Directory with icons
- Language version display (Python, Node, Rust, Go)
- Command duration
- Context-aware styling

### iTerm2 Theme (`claude-theme.itermcolors`)
- Custom Claude color palette
- Warm dark background
- Coral cursor
- All 16 ANSI colors tuned to theme

### Claude Code (`claude-code/`)
- Custom status line showing model, directory, git branch, and context usage
- Claude-themed status line colors

### Neofetch (`neofetch/`)
- Custom happy Claude flower ASCII art
- Claude color scheme
- System info display

## Installation

### Prerequisites

```bash
# Install Homebrew packages
brew install starship eza bat neofetch
brew install zsh-autosuggestions zsh-syntax-highlighting

# Install Nerd Font
brew install --cask font-jetbrains-mono-nerd-font
```

### Setup

```bash
# Clone the repo
git clone https://github.com/rushdhan-ibrahim/dotfiles.git ~/dotfiles

# Symlink configs
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/neofetch ~/.config/neofetch

# Claude Code (if using)
mkdir -p ~/.claude
ln -sf ~/dotfiles/claude-code/settings.json ~/.claude/settings.json
ln -sf ~/dotfiles/claude-code/statusline.sh ~/.claude/statusline.sh
chmod +x ~/.claude/statusline.sh

# iTerm2: Import color scheme
# Open iTerm > Settings > Profiles > Colors > Color Presets > Import
# Select: ~/dotfiles/iterm/claude-theme.itermcolors

# Set font in iTerm
# Settings > Profiles > Text > Font > JetBrainsMono Nerd Font (14pt)
```

### Reload

```bash
source ~/.zshrc
```

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+E` | Accept autosuggestion |
| `→` | Accept autosuggestion |
| `↑/↓` | Search history |
| `Shift+Enter` | Multiline input (iTerm) |

## Git Aliases

| Alias | Command |
|-------|---------|
| `git st` | `status -sb` |
| `git co` | `checkout` |
| `git br` | `branch` |
| `git cm "msg"` | `commit -m` |
| `git lg` | Pretty log graph |
| `git undo` | Undo last commit |
| `git amend` | Amend last commit |

## Shell Aliases

| Alias | Command |
|-------|---------|
| `ls` | `eza --icons` |
| `ll` | `eza -la --icons --git` |
| `lt` | `eza --tree --level=2` |
| `cat` | `bat --style=auto` |
| `reload` | `source ~/.zshrc` |

---

*Generated with Claude Code*
