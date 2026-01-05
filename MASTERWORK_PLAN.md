# 🎨 Dotfiles Masterwork Plan

> *"A true opus of terminal aesthetics and functionality"*

This document outlines a comprehensive plan to transform these dotfiles into a stunning, functional, fast, and intuitive terminal experience. Every detail has been considered to create harmony between beauty and productivity.

---

## Table of Contents

1. [Vision & Philosophy](#vision--philosophy)
2. [Phase 1: Foundation Enhancement](#phase-1-foundation-enhancement)
3. [Phase 2: Editor Excellence](#phase-2-editor-excellence)
4. [Phase 3: Multiplexer Mastery](#phase-3-multiplexer-mastery)
5. [Phase 4: Terminal Diversity](#phase-4-terminal-diversity)
6. [Phase 5: Git Workflow Revolution](#phase-5-git-workflow-revolution)
7. [Phase 6: Shell Superpowers](#phase-6-shell-superpowers)
8. [Phase 7: Visual Polish](#phase-7-visual-polish)
9. [Phase 8: Cross-Platform & Portability](#phase-8-cross-platform--portability)
10. [Color Palette Reference](#color-palette-reference)
11. [Implementation Priority](#implementation-priority)

---

## Vision & Philosophy

### Core Principles

| Principle | Description |
|-----------|-------------|
| **Coherent Beauty** | Every tool shares the Claude color palette - warm, earthy, professional |
| **Speed First** | Lazy loading, async operations, compiled where possible |
| **Intuitive Muscle Memory** | Consistent keybindings across all tools (vim-style everywhere) |
| **Progressive Disclosure** | Simple by default, power when needed |
| **Self-Documenting** | Built-in help, cheatsheets, discoverable features |

### The Claude Aesthetic

```
┌─────────────────────────────────────────────────────────────┐
│  Warm coral accents on deep charcoal                        │
│  Soft sage greens for success                               │
│  Dusty rose for metadata                                    │
│  Sand tones for paths and secondary info                    │
│  Cream text that's easy on the eyes                         │
│  No harsh neons - sophisticated and calming                 │
└─────────────────────────────────────────────────────────────┘
```

---

## Phase 1: Foundation Enhancement

### 1.1 Shell Performance Optimization

**Goal:** Sub-100ms shell startup time

**Current State:** Basic zsh with synchronous plugin loading

**Improvements:**

```
zsh/
├── .zshrc                    # Minimal, fast-loading entry point
├── .zshenv                   # Environment variables (loaded first)
├── .zprofile                 # Login shell config
├── lazy/
│   ├── completions.zsh       # Deferred completion loading
│   ├── functions.zsh         # Autoloaded functions
│   └── plugins.zsh           # Lazy plugin initialization
└── themes/
    └── claude.zsh-theme      # Custom theme fallback
```

**Key Changes:**
- [ ] Implement zinit/zplug for lazy plugin loading
- [ ] Defer compinit until after prompt displays
- [ ] Use zsh-defer for non-critical initializations
- [ ] Compile .zshrc to .zshrc.zwc for faster parsing
- [ ] Profile startup with `zprof` and optimize bottlenecks

### 1.2 Enhanced Aliases & Functions

**New Alias Categories:**

```bash
# === Navigation Superpowers ===
alias z='zoxide'              # Smart directory jumping
alias zi='zoxide query -i'    # Interactive selection
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'             # Previous directory

# === File Operations ===
alias cp='cp -iv'             # Interactive, verbose
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# === Modern Replacements ===
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias la='eza -a --icons'
alias lt='eza --tree --level=3 --icons --git-ignore'
alias cat='bat --style=auto'
alias grep='rg'               # Ripgrep
alias find='fd'               # fd-find
alias du='dust'               # Disk usage
alias df='duf'                # Disk free
alias top='btop'              # Better top
alias diff='delta'            # Beautiful diffs
alias ping='prettyping'       # Pretty ping

# === Development ===
alias g='git'
alias v='nvim'
alias vim='nvim'
alias lg='lazygit'
alias ld='lazydocker'
alias k='kubectl'
alias d='docker'
alias dc='docker compose'

# === Quick Edits ===
alias zshrc='$EDITOR ~/.zshrc && source ~/.zshrc'
alias vimrc='$EDITOR ~/.config/nvim/init.lua'
alias tmuxconf='$EDITOR ~/.tmux.conf && tmux source ~/.tmux.conf'
```

**Powerful Functions:**

```bash
# Create directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1" }

# Extract any archive
extract() {
  case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz)  tar xzf $1 ;;
    *.tar.xz)  tar xJf $1 ;;
    *.zip)     unzip $1 ;;
    *.rar)     unrar x $1 ;;
    *.7z)      7z x $1 ;;
    *)         echo "Unknown format: $1" ;;
  esac
}

# Quick notes
note() { echo "$(date): $*" >> ~/notes.md }

# Weather in terminal
weather() { curl "wttr.in/${1:-}" }

# Cheatsheet lookup
cheat() { curl "cheat.sh/$1" }

# Pretty PATH display
path() { echo $PATH | tr ':' '\n' | nl }

# Port lookup
port() { lsof -i ":$1" }

# Quick server
serve() { python3 -m http.server ${1:-8000} }
```

### 1.3 FZF Integration (The Game Changer)

**Installation:** Add fzf with Claude-themed colors

```bash
# FZF Configuration
export FZF_DEFAULT_OPTS="
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt='❯ '
  --pointer='▶'
  --marker='✓'
  --color=bg+:#2a2725,bg:#1a1816,spinner:#d4a27f,hl:#c4746e
  --color=fg:#e8dfd6,header:#c4746e,info:#c4b28a,pointer:#d4a27f
  --color=marker:#8a9a7b,fg+:#e8dfd6,prompt:#d4a27f,hl+:#c4746e
  --color=border:#625e5a
"

# Use fd for faster file finding
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
```

**Key Bindings:**
| Binding | Action |
|---------|--------|
| `Ctrl+R` | Fuzzy history search |
| `Ctrl+T` | Fuzzy file finder |
| `Alt+C` | Fuzzy cd to directory |
| `Ctrl+G` | Fuzzy git operations |
| `**<Tab>` | Fuzzy completion trigger |

---

## Phase 2: Editor Excellence

### 2.1 Neovim Configuration

**Goal:** A fast, beautiful, LSP-powered editor with Claude aesthetics

**Structure:**

```
nvim/
├── init.lua                  # Entry point
├── lua/
│   ├── core/
│   │   ├── options.lua       # Vim options
│   │   ├── keymaps.lua       # Key bindings
│   │   ├── autocmds.lua      # Auto commands
│   │   └── lazy.lua          # Plugin manager bootstrap
│   ├── plugins/
│   │   ├── ui.lua            # UI plugins (statusline, bufferline)
│   │   ├── editor.lua        # Editor enhancements
│   │   ├── lsp.lua           # LSP configuration
│   │   ├── completion.lua    # Autocompletion
│   │   ├── treesitter.lua    # Syntax highlighting
│   │   ├── git.lua           # Git integration
│   │   ├── telescope.lua     # Fuzzy finder
│   │   └── ai.lua            # AI assistants
│   └── themes/
│       └── claude.lua        # Custom Claude colorscheme
└── after/
    └── ftplugin/             # Filetype-specific settings
```

**Core Plugins:**

| Category | Plugin | Purpose |
|----------|--------|---------|
| **Package Manager** | lazy.nvim | Blazing fast, lazy-loading |
| **UI** | lualine.nvim | Beautiful statusline |
| **UI** | bufferline.nvim | Tab/buffer management |
| **UI** | nvim-tree.lua | File explorer |
| **UI** | dashboard-nvim | Startup screen |
| **Editor** | telescope.nvim | Fuzzy finder for everything |
| **Editor** | which-key.nvim | Keybinding hints |
| **Editor** | flash.nvim | Lightning-fast navigation |
| **Editor** | mini.pairs | Auto pairs |
| **Editor** | mini.surround | Surround operations |
| **Editor** | Comment.nvim | Smart commenting |
| **LSP** | nvim-lspconfig | LSP configurations |
| **LSP** | mason.nvim | LSP/DAP/Linter manager |
| **LSP** | none-ls.nvim | Formatting/diagnostics |
| **Completion** | nvim-cmp | Completion engine |
| **Completion** | LuaSnip | Snippet engine |
| **Syntax** | nvim-treesitter | Better syntax highlighting |
| **Git** | gitsigns.nvim | Git decorations |
| **Git** | diffview.nvim | Beautiful diff viewer |
| **Git** | neogit | Magit-like git UI |
| **AI** | copilot.lua | GitHub Copilot |

### 2.2 Claude Colorscheme for Neovim

```lua
-- Claude Colorscheme Definition
local colors = {
  bg = "#1a1816",
  bg_dark = "#151311",
  bg_light = "#2a2725",
  fg = "#e8dfd6",
  fg_dark = "#c4bab0",

  coral = "#d4a27f",      -- Primary accent
  terracotta = "#c4746e", -- Errors, deletions
  sand = "#c4b28a",       -- Warnings, directories
  sage = "#8a9a7b",       -- Success, strings
  dusty_rose = "#a292a3", -- Purple/magenta
  teal = "#8ea4a2",       -- Cyan, functions
  warm_gray = "#625e5a",  -- Comments

  -- Semantic colors
  error = "#c4746e",
  warning = "#c4b28a",
  info = "#8ea4a2",
  hint = "#a292a3",
  success = "#8a9a7b",
}

-- Highlights applied to:
-- - Syntax (functions, keywords, strings, etc.)
-- - LSP diagnostics
-- - Git signs
-- - Statusline
-- - Telescope
-- - Completion menu
-- - All UI elements
```

### 2.3 Key Features

**Dashboard:**
```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│                    ◠◡◠                                     │
│                   (  ◡  )                                  │
│                    ╲   ╱                                   │
│                     │ │                                    │
│                    ╱   ╲                                   │
│                                                            │
│              Welcome back, Developer                       │
│                                                            │
│    [f] Find file     [r] Recent files    [n] New file     │
│    [g] Live grep     [p] Projects        [c] Config       │
│    [q] Quit                                                │
│                                                            │
│              "The best code is no code at all"             │
└────────────────────────────────────────────────────────────┘
```

**Which-Key Integration:**
- Space as leader key
- Organized mnemonic groups:
  - `<leader>f` - Find/Files
  - `<leader>g` - Git
  - `<leader>l` - LSP
  - `<leader>b` - Buffers
  - `<leader>w` - Windows
  - `<leader>x` - Diagnostics
  - `<leader>s` - Search/Replace

---

## Phase 3: Multiplexer Mastery

### 3.1 Tmux Configuration

**Goal:** Intuitive multiplexing with Claude aesthetics

**Structure:**

```
tmux/
├── tmux.conf                 # Main configuration
├── themes/
│   └── claude.conf           # Color theme
└── plugins/                  # TPM plugins
```

**Key Features:**

```bash
# === Prefix Key ===
set -g prefix C-a             # More ergonomic than C-b
bind C-a send-prefix

# === Modern Defaults ===
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
set -g mouse on
set -g base-index 1
set -g pane-base-index 1
set -g renumber-windows on
set -g history-limit 50000

# === Vim-Style Navigation ===
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# === Intuitive Splits ===
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# === Quick Actions ===
bind r source-file ~/.tmux.conf \; display "Reloaded!"
bind z resize-pane -Z         # Zoom toggle
```

### 3.2 Claude-Themed Status Bar

```
┌────────────────────────────────────────────────────────────┐
│ ◠◡◠ │ ❯ zsh │ ▌1:nvim  2:shell  3:git▐ │ cpu:5% │ 14:32 │
└────────────────────────────────────────────────────────────┘
```

**Design:**
- Left: Claude icon + current command
- Center: Window tabs with active highlight
- Right: System stats + clock
- Colors: Coral accents on warm dark background

**Plugins:**
- `tmux-sensible` - Sensible defaults
- `tmux-resurrect` - Session persistence
- `tmux-continuum` - Auto-save sessions
- `tmux-fzf` - FZF integration
- `tmux-yank` - Better copy/paste

---

## Phase 4: Terminal Diversity

### 4.1 Alacritty Configuration

**Goal:** GPU-accelerated speed with Claude aesthetics

```yaml
# alacritty/alacritty.toml
[window]
padding = { x = 12, y = 12 }
decorations = "Buttonless"
opacity = 0.97
blur = true

[font]
normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }
size = 14.0

[colors.primary]
background = "#1a1816"
foreground = "#e8dfd6"

[colors.cursor]
cursor = "#d4a27f"
text = "#1a1816"

[colors.normal]
black   = "#2a2725"
red     = "#c4746e"
green   = "#8a9a7b"
yellow  = "#c4b28a"
blue    = "#8ea4a2"
magenta = "#a292a3"
cyan    = "#8ea4a2"
white   = "#e8dfd6"

# ... bright variants
```

### 4.2 Kitty Configuration

**Goal:** Feature-rich terminal with GPU rendering

```conf
# kitty/kitty.conf
font_family      JetBrainsMono Nerd Font
font_size        14.0
window_padding_width 12

# Claude Theme
background  #1a1816
foreground  #e8dfd6
cursor      #d4a27f
selection_background #3a3735
selection_foreground #e8dfd6

# Tab bar styling
tab_bar_style powerline
tab_powerline_style slanted
active_tab_background #d4a27f
active_tab_foreground #1a1816
inactive_tab_background #2a2725

# Keyboard shortcuts (vim-inspired)
map ctrl+shift+t new_tab_with_cwd
map ctrl+shift+enter new_window_with_cwd
map ctrl+shift+h neighboring_window left
map ctrl+shift+l neighboring_window right
```

### 4.3 WezTerm Configuration

**Goal:** Highly configurable with Lua scripting

```lua
-- wezterm/wezterm.lua
local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Claude'
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14.0

config.window_background_opacity = 0.97
config.macos_window_background_blur = 20
config.window_padding = { left = 12, right = 12, top = 12, bottom = 12 }

-- Claude color scheme definition
config.color_schemes = {
  ['Claude'] = {
    background = '#1a1816',
    foreground = '#e8dfd6',
    cursor_bg = '#d4a27f',
    cursor_fg = '#1a1816',
    selection_bg = '#3a3735',
    -- ... full palette
  },
}

-- Tab bar styling
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

-- Key bindings for productivity
config.keys = {
  { key = 't', mods = 'CMD', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'h', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
  -- ... more bindings
}

return config
```

---

## Phase 5: Git Workflow Revolution

### 5.1 Enhanced Git Configuration

```gitconfig
# git/.gitconfig
[user]
    name = Your Name
    email = you@example.com

[core]
    editor = nvim
    pager = delta
    autocrlf = input
    excludesfile = ~/.gitignore_global

[init]
    defaultBranch = main

[pull]
    rebase = true

[push]
    autoSetupRemote = true
    default = current

[fetch]
    prune = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
    algorithm = histogram

[rebase]
    autosquash = true
    autostash = true

# === Delta Configuration ===
[delta]
    navigate = true
    side-by-side = true
    line-numbers = true
    syntax-theme = claude

# === Aliases ===
[alias]
    # Status
    s = status -sb
    st = status

    # Commits
    c = commit
    cm = commit -m
    ca = commit --amend
    can = commit --amend --no-edit

    # Branches
    b = branch
    ba = branch -a
    bd = branch -d
    bD = branch -D
    sw = switch
    swc = switch -c

    # Logging
    l = log --oneline -20
    lg = log --graph --oneline --decorate
    ll = log --graph --pretty=format:'%C(#d4a27f)%h%Creset -%C(#c4b28a)%d%Creset %s %C(#625e5a)(%cr) %C(#8ea4a2)<%an>%Creset'

    # Diff
    d = diff
    ds = diff --staged

    # Stash
    ss = stash
    sp = stash pop
    sl = stash list

    # Undo
    undo = reset --soft HEAD~1
    unstage = reset HEAD --
    discard = checkout --

    # Utilities
    aliases = config --get-regexp alias
    contributors = shortlog -sn
    today = log --since=midnight --oneline
    week = log --since='1 week ago' --oneline
```

### 5.2 Delta Theme (claude.gitconfig)

```gitconfig
[delta "claude"]
    dark = true
    syntax-theme = base16
    file-style = "#d4a27f" bold
    file-decoration-style = "#625e5a" ol
    hunk-header-style = "#c4b28a" italic
    hunk-header-decoration-style = "#625e5a" box
    line-numbers-left-style = "#625e5a"
    line-numbers-right-style = "#625e5a"
    line-numbers-minus-style = "#c4746e"
    line-numbers-plus-style = "#8a9a7b"
    minus-style = syntax "#3a2020"
    minus-emph-style = syntax "#5a2020"
    plus-style = syntax "#203a20"
    plus-emph-style = syntax "#205a20"
    map-styles = bold purple => syntax "#2a2535", bold cyan => syntax "#203535"
```

### 5.3 Lazygit Configuration

```yaml
# lazygit/config.yml
gui:
  theme:
    activeBorderColor:
      - "#d4a27f"
      - bold
    inactiveBorderColor:
      - "#625e5a"
    selectedLineBgColor:
      - "#2a2725"
    cherryPickedCommitFgColor:
      - "#8a9a7b"
    defaultFgColor:
      - "#e8dfd6"

  showFileTree: true
  showRandomTip: false
  nerdFontsVersion: "3"

keybinding:
  universal:
    quit: 'q'
    return: '<esc>'
    togglePanel: '<tab>'

git:
  paging:
    colorArg: always
    pager: delta --paging=never
```

---

## Phase 6: Shell Superpowers

### 6.1 Zoxide (Smart Directory Jumping)

**Installation:** `brew install zoxide`

**Usage:**
```bash
z foo      # cd to highest ranked directory matching foo
z foo bar  # cd to directory matching foo and bar
zi         # Interactive selection with fzf
```

### 6.2 Atuin (Magical Shell History)

**Features:**
- Sync history across machines
- Fuzzy search with context
- Statistics and analytics
- Encrypted cloud backup

```toml
# atuin/config.toml
[theme]
name = "claude"

[style]
background = "#1a1816"
foreground = "#e8dfd6"
selected = "#d4a27f"
```

### 6.3 Direnv (Per-Directory Environments)

**Integration:**
```bash
# .envrc per project
export DATABASE_URL="..."
layout python3
```

### 6.4 Mise (Polyglot Version Manager)

**Replaces:** nvm, pyenv, rbenv, etc.

```toml
# ~/.config/mise/config.toml
[tools]
node = "lts"
python = "3.12"
rust = "stable"
go = "latest"
```

---

## Phase 7: Visual Polish

### 7.1 Enhanced Starship Prompt

**Additions:**
- AWS/GCP/Azure context
- Kubernetes context
- Docker context
- More language support
- Custom segments

```toml
# Extended starship.toml additions

[aws]
format = ' [$symbol($profile)(\($region\))]($style) '
symbol = " "
style = "bold #c4b28a"

[kubernetes]
format = ' [$symbol$context( \($namespace\))]($style) '
symbol = "󱃾 "
style = "bold #8ea4a2"
disabled = false

[docker_context]
format = ' [$symbol$context]($style) '
symbol = " "
style = "bold #8ea4a2"

[custom.claude]
command = "echo '◠◡◠'"
when = "true"
format = "[$output]($style) "
style = "#d4a27f"
```

### 7.2 Bat Themes

```bash
# bat/config
--theme="Claude"
--style="numbers,changes,header"
--italic-text=always
--map-syntax "*.conf:INI"
--map-syntax ".gitignore:Git Ignore"
```

### 7.3 LS Colors (eza)

```bash
# Custom LS_COLORS for eza
export LS_COLORS="di=#c4b28a:fi=#e8dfd6:ln=#8ea4a2:ex=#8a9a7b:*.md=#a292a3:*.json=#d4a27f"
```

### 7.4 Neofetch Enhancement

**New ASCII Art Options:**

```
Option 1: Minimal Claude Face
     ◠◡◠
    (  ◡  )
     ╲   ╱

Option 2: Claude Logo Stylized
    ╭─────────╮
    │  ◠ ◡ ◠  │
    │ (  ◡  ) │
    │  ╲   ╱  │
    ╰────┬────╯
         │

Option 3: Full Claude Flower (current)
    (Existing design enhanced with animation)
```

---

## Phase 8: Cross-Platform & Portability

### 8.1 Directory Structure

```
dotfiles/
├── install.sh                # Smart installer
├── uninstall.sh              # Clean removal
├── README.md                 # Documentation
├── MASTERWORK_PLAN.md        # This file
│
├── shell/
│   ├── zsh/
│   │   ├── .zshrc
│   │   ├── .zshenv
│   │   ├── .zprofile
│   │   └── lib/              # Modular configs
│   ├── bash/
│   │   ├── .bashrc
│   │   └── .bash_profile
│   └── fish/
│       └── config.fish
│
├── editors/
│   ├── nvim/                 # Neovim config
│   └── vim/                  # Vim fallback
│
├── terminals/
│   ├── alacritty/
│   ├── kitty/
│   ├── wezterm/
│   └── iterm/
│
├── multiplexers/
│   ├── tmux/
│   └── zellij/               # Modern alternative
│
├── git/
│   ├── .gitconfig
│   ├── .gitignore_global
│   ├── delta/
│   └── lazygit/
│
├── prompts/
│   └── starship/
│
├── tools/
│   ├── bat/
│   ├── fzf/
│   ├── atuin/
│   └── mise/
│
├── system/
│   ├── neofetch/
│   ├── btop/
│   └── yazi/                 # Terminal file manager
│
├── claude/
│   └── claude-code/
│
├── themes/
│   ├── claude-palette.yaml   # Master color definitions
│   └── exports/              # Generated themes for each tool
│
└── scripts/
    ├── lib/                  # Shared functions
    ├── theme-generator.sh    # Generate themes from palette
    └── health-check.sh       # Verify installation
```

### 8.2 Smart Installer

```bash
#!/usr/bin/env bash
# install.sh - Intelligent dotfiles installer

# Detect OS
case "$(uname -s)" in
  Linux*)  OS=linux;;
  Darwin*) OS=macos;;
  *)       OS=unknown;;
esac

# Detect package manager
if command -v brew &>/dev/null; then
  PKG_MGR="brew"
elif command -v apt &>/dev/null; then
  PKG_MGR="apt"
elif command -v pacman &>/dev/null; then
  PKG_MGR="pacman"
fi

# Modular installation
install_shell() { ... }
install_editor() { ... }
install_terminal() { ... }
install_tools() { ... }

# Interactive mode
select_components() {
  # Use gum/fzf for beautiful selection
}

# Backup existing configs
backup_existing() { ... }

# Create symlinks
create_symlinks() { ... }

# Verify installation
health_check() { ... }
```

### 8.3 Theme Generator

**Concept:** Single source of truth for all colors

```yaml
# themes/claude-palette.yaml
name: Claude
author: Anthropic
version: 1.0

colors:
  # Base
  background: "#1a1816"
  foreground: "#e8dfd6"

  # Accents
  primary: "#d4a27f"
  secondary: "#c4b28a"

  # Semantic
  error: "#c4746e"
  success: "#8a9a7b"
  warning: "#c4b28a"
  info: "#8ea4a2"

  # ANSI
  black: "#2a2725"
  red: "#c4746e"
  green: "#8a9a7b"
  yellow: "#c4b28a"
  blue: "#8ea4a2"
  magenta: "#a292a3"
  cyan: "#8ea4a2"
  white: "#e8dfd6"
```

**Generator Script:**
```bash
# Reads palette, generates:
# - alacritty.toml colors
# - kitty.conf colors
# - wezterm.lua colors
# - iterm2.itermcolors
# - nvim lua theme
# - tmux theme
# - bat theme
# - delta theme
# - fzf colors
# - starship colors
# - lazygit colors
```

---

## Color Palette Reference

### Primary Palette

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| **Background** | `#1a1816` | `26, 24, 22` | Terminal/editor background |
| **Background Light** | `#2a2725` | `42, 39, 37` | Selection, active items |
| **Foreground** | `#e8dfd6` | `232, 223, 214` | Primary text |
| **Foreground Dim** | `#c4bab0` | `196, 186, 176` | Secondary text |

### Accent Palette

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| **Coral** | `#d4a27f` | `212, 162, 127` | Primary accent, cursor, prompts |
| **Terracotta** | `#c4746e` | `196, 116, 110` | Errors, deletions, warnings |
| **Sand** | `#c4b28a` | `196, 178, 138` | Directories, paths, types |
| **Sage** | `#8a9a7b` | `138, 154, 123` | Success, strings, additions |
| **Dusty Rose** | `#a292a3` | `162, 146, 163` | Keywords, special |
| **Teal** | `#8ea4a2` | `142, 164, 162` | Functions, links, info |
| **Warm Gray** | `#625e5a` | `98, 94, 90` | Comments, muted text |

### Extended Palette (for syntax highlighting)

| Name | Hex | Usage |
|------|-----|-------|
| **Peach** | `#e8b89d` | Numbers, constants |
| **Lavender** | `#b8a9c9` | Built-in functions |
| **Mint** | `#a3c4a2` | Strings (alternate) |
| **Rust** | `#b86e5d` | Errors (intense) |
| **Gold** | `#d4b87f` | Warnings (intense) |

---

## Implementation Priority

### Phase 1: Foundation (Week 1)
1. [ ] Shell performance optimization
2. [ ] FZF integration with Claude theme
3. [ ] Enhanced aliases and functions
4. [ ] Zoxide installation

### Phase 2: Editor (Week 2)
5. [ ] Neovim configuration from scratch
6. [ ] Claude colorscheme for Neovim
7. [ ] LSP setup for major languages
8. [ ] Which-key integration

### Phase 3: Multiplexer (Week 3)
9. [ ] Tmux configuration
10. [ ] Claude-themed status bar
11. [ ] Session management

### Phase 4: Terminals (Week 4)
12. [ ] Alacritty configuration
13. [ ] Kitty configuration
14. [ ] WezTerm configuration

### Phase 5: Git (Week 5)
15. [ ] Enhanced gitconfig
16. [ ] Delta setup with Claude theme
17. [ ] Lazygit configuration

### Phase 6: Polish (Week 6)
18. [ ] Cross-platform installer
19. [ ] Theme generator
20. [ ] Documentation
21. [ ] Health check script

---

## Success Metrics

| Metric | Target |
|--------|--------|
| Shell startup time | < 100ms |
| Neovim startup time | < 50ms |
| Time to productive after fresh install | < 5 minutes |
| Color consistency | 100% palette adherence |
| Keybinding conflicts | Zero |
| Documentation coverage | 100% |

---

## Inspirations & Credits

- **Catppuccin** - Color palette structure
- **TokyoNight** - Neovim config organization
- **Oh My Zsh** - Plugin ecosystem ideas
- **Doom Emacs** - Keybinding philosophy
- **Claude** - The warm, thoughtful aesthetic

---

*"The details are not the details. They make the design."* — Charles Eames

---

## Quick Start (Future)

```bash
# One-liner installation
curl -fsSL https://raw.githubusercontent.com/you/dotfiles/main/install.sh | bash

# Or clone and install
git clone https://github.com/you/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

---

**Last Updated:** $(date +%Y-%m-%d)
**Status:** Planning Phase
