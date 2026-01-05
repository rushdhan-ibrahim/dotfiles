# ══════════════════════════════════════════════════════════════════════════════
#                              Completions
#                        (Deferred for fast startup)
# ══════════════════════════════════════════════════════════════════════════════

# Initialize completion system
autoload -Uz compinit

# Only check cache once a day for faster startup
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Completion styling
zstyle ':completion:*' menu select                          # Menu selection
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colorize completions
zstyle ':completion:*' special-dirs true                   # Complete . and ..
zstyle ':completion:*' squeeze-slashes true                # Treat // as /

# Group completions
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{#d4a27f}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{#8a9a7b}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format '%F{#c4746e}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{#c4746e}-- no matches found --%f'

# Cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# Man pages completion
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# SSH/SCP completion
zstyle ':completion:*:(ssh|scp|rsync):*' hosts off
zstyle ':completion:*:(ssh|scp|rsync):*' users off
