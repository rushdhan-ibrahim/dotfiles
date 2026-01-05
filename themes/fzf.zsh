# ══════════════════════════════════════════════════════════════════════════════
#                              FZF Theme
#                        Claude-themed Fuzzy Finder
# ══════════════════════════════════════════════════════════════════════════════
# This file configures FZF to use the Claude palette.
# The fuzzy finder should feel like an integrated part of the Claude experience.
#
# Performance target: < 0.5ms load time

# ══════════════════════════════════════════════════════════════════════════════
#                              COLOR SCHEME
# ══════════════════════════════════════════════════════════════════════════════

export FZF_DEFAULT_OPTS="
  --color=fg:#e8dfd6,fg+:#e8dfd6,bg:#1a1816,bg+:#2a2725
  --color=hl:#d4a27f,hl+:#d4a27f,info:#a292a3,marker:#8a9a7b
  --color=prompt:#d4a27f,spinner:#8ea4a2,pointer:#8ea4a2,header:#d4a27f
  --color=border:#625e5a,label:#d4a27f,query:#e8dfd6
  --border=rounded
  --border-label=' ◠◡◠ '
  --border-label-pos=0
  --preview-window=border-rounded
  --prompt='  '
  --pointer='❯'
  --marker='✓'
  --separator='─'
  --scrollbar='│'
  --layout=reverse
  --info=inline
  --height=60%
  --multi
"

# ══════════════════════════════════════════════════════════════════════════════
#                              COMMAND-SPECIFIC OPTIONS
# ══════════════════════════════════════════════════════════════════════════════

# Ctrl+T: File finder
export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || eza --color=always --icons -la {} 2>/dev/null || ls -la {}'
  --preview-window=right:60%:wrap
  --bind 'ctrl-/:toggle-preview'
  --header '  Find Files'
"

# Ctrl+R: History search
export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window=down:3:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header '  History'
"

# Alt+C: Directory finder
export FZF_ALT_C_OPTS="
  --preview 'eza --color=always --icons --tree --level=2 {} 2>/dev/null || ls -la {}'
  --preview-window=right:50%
  --header '  Change Directory'
"

# ══════════════════════════════════════════════════════════════════════════════
#                              FZF-TAB INTEGRATION
# ══════════════════════════════════════════════════════════════════════════════
# If using fzf-tab plugin, these enhance tab completion

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Preview window for fzf-tab
zstyle ':fzf-tab:*' fzf-flags --color=fg:#e8dfd6,bg:#1a1816,hl:#d4a27f --color=fg+:#e8dfd6,bg+:#2a2725,hl+:#d4a27f --color=info:#a292a3,prompt:#d4a27f,pointer:#8ea4a2 --color=marker:#8a9a7b,spinner:#8ea4a2,header:#d4a27f

# Preview directory/file contents
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons -1 $realpath 2>/dev/null || ls -1 $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null || cat $realpath 2>/dev/null || eza --color=always --icons -la $realpath'

# ══════════════════════════════════════════════════════════════════════════════
#                              KEYBINDINGS
# ══════════════════════════════════════════════════════════════════════════════

# Use fd for faster file finding if available
if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# Use ripgrep for content search if available
if command -v rg &>/dev/null; then
    # Fuzzy grep function
    fzf_grep() {
        rg --color=always --line-number --no-heading --smart-case "${*:-}" |
            fzf --ansi \
                --delimiter=':' \
                --preview 'bat --color=always --style=numbers --highlight-line={2} {1} 2>/dev/null | head -500' \
                --preview-window=right:60%:wrap \
                --header '  Grep' \
                --bind 'enter:become(nvim {1} +{2})'
    }
    alias fg='fzf_grep'
fi
