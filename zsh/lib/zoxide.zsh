# ══════════════════════════════════════════════════════════════════════════════
#                              Zoxide Configuration
#                         Smart directory jumping
# ══════════════════════════════════════════════════════════════════════════════

# Check if zoxide is installed
if ! command -v zoxide &>/dev/null; then
    return
fi

# Initialize zoxide
eval "$(zoxide init zsh)"

# Aliases for zoxide
alias j='z'                  # Quick jump
alias ji='zi'                # Interactive jump with fzf

# FZF integration for zoxide (if fzf available)
if command -v fzf &>/dev/null; then
    # Override zi to use Claude-themed fzf
    export _ZO_FZF_OPTS="
        --height=40%
        --layout=reverse
        --border=rounded
        --prompt='  '
        --pointer='▶'
        --color=bg+:#2a2725,bg:#1a1816,spinner:#d4a27f,hl:#c4746e
        --color=fg:#e8dfd6,header:#c4746e,info:#c4b28a,pointer:#d4a27f
        --color=marker:#8a9a7b,fg+:#e8dfd6,prompt:#d4a27f,hl+:#c4746e
        --color=border:#625e5a
        --preview='eza --tree --level=2 --color=always --icons {2..}'
        --preview-window='right:40%'
    "
fi
