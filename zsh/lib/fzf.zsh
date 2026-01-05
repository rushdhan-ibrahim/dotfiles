# ══════════════════════════════════════════════════════════════════════════════
#                              FZF Configuration
#                         Claude-themed fuzzy finder
# ══════════════════════════════════════════════════════════════════════════════

# Check if fzf is installed
if ! command -v fzf &>/dev/null; then
    return
fi

# Claude color scheme for FZF
export FZF_DEFAULT_OPTS="
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt='  '
  --pointer='▶'
  --marker='✓'
  --info=inline
  --ansi
  --color=bg+:#2a2725,bg:#1a1816,spinner:#d4a27f,hl:#c4746e
  --color=fg:#e8dfd6,header:#c4746e,info:#c4b28a,pointer:#d4a27f
  --color=marker:#8a9a7b,fg+:#e8dfd6,prompt:#d4a27f,hl+:#c4746e
  --color=border:#625e5a,label:#c4b28a,query:#e8dfd6
  --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'
  --bind='ctrl-y:execute-silent(echo {} | pbcopy)'
"

# Use fd for faster file finding (if available)
if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# Preview settings
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --line-range :300 {} 2>/dev/null || cat {}'
  --preview-window 'right:60%:border-left'
  --bind 'ctrl-/:toggle-preview'
"

export FZF_ALT_C_OPTS="
  --preview 'eza --tree --level=2 --color=always --icons {} | head -100'
  --preview-window 'right:50%:border-left'
"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window 'down:3:wrap'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
"

# Load fzf keybindings and completion
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh

# ══════════════════════════════════════════════════════════════════════════════
#                              FZF Functions
# ══════════════════════════════════════════════════════════════════════════════

# Interactive cd with preview
fcd() {
    local dir
    dir=$(fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf --preview 'eza --tree --level=2 --color=always --icons {}') && cd "$dir"
}

# Interactive file edit
fe() {
    local file
    file=$(fzf --preview 'bat --style=numbers --color=always --line-range :300 {}') && ${EDITOR:-vim} "$file"
}

# Interactive git branch checkout
fgb() {
    local branch
    branch=$(git branch --all | fzf --preview 'git log --oneline --graph --color=always {1}' | sed 's/^[* ]*//' | sed 's#remotes/origin/##')
    [[ -n "$branch" ]] && git checkout "$branch"
}

# Interactive git log browser
fgl() {
    git log --oneline --color=always | fzf --ansi --preview 'git show --color=always {1}' | cut -d' ' -f1 | xargs -r git show
}

# Interactive process kill
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m --header='[Kill Process]' | awk '{print $2}')
    [[ -n "$pid" ]] && echo "$pid" | xargs kill -9
}

# Interactive history search
fh() {
    local cmd
    cmd=$(fc -ln 1 | fzf --tac --no-sort)
    [[ -n "$cmd" ]] && print -z "$cmd"
}

# Interactive environment variable viewer
fenv() {
    printenv | fzf
}
