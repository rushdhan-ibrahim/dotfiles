# ══════════════════════════════════════════════════════════════════════════════
#                              Key Bindings
# ══════════════════════════════════════════════════════════════════════════════

# Use emacs-style keybindings
bindkey -e

# === Navigation ===
bindkey '^[[H' beginning-of-line      # Home
bindkey '^[[F' end-of-line            # End
bindkey '^[[3~' delete-char           # Delete
bindkey '^[[1;5C' forward-word        # Ctrl+Right
bindkey '^[[1;5D' backward-word       # Ctrl+Left

# === History ===
bindkey '^[[A' history-search-backward  # Up arrow - search history
bindkey '^[[B' history-search-forward   # Down arrow - search history
bindkey '^P' history-search-backward    # Ctrl+P
bindkey '^N' history-search-forward     # Ctrl+N

# === Editing ===
bindkey '^W' backward-kill-word         # Ctrl+W - delete word backward
bindkey '^U' backward-kill-line         # Ctrl+U - delete to beginning
bindkey '^K' kill-line                  # Ctrl+K - delete to end
bindkey '^Y' yank                       # Ctrl+Y - paste killed text

# === Autosuggestions ===
bindkey '^E' autosuggest-accept         # Ctrl+E - accept suggestion
bindkey '^[[C' autosuggest-accept       # Right arrow - accept suggestion
bindkey '^ ' autosuggest-accept         # Ctrl+Space - accept suggestion

# === Misc ===
bindkey '^L' clear-screen               # Ctrl+L - clear screen
bindkey '^Z' undo                       # Ctrl+Z - undo
bindkey '^X^E' edit-command-line        # Ctrl+X Ctrl+E - edit in $EDITOR

# Enable edit-command-line widget
autoload -Uz edit-command-line
zle -N edit-command-line
