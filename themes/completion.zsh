# ══════════════════════════════════════════════════════════════════════════════
#                              Completion Styling
#                        Claude-themed Tab Completion
# ══════════════════════════════════════════════════════════════════════════════
# This file styles the ZSH completion menu with Claude colors.
#
# Performance target: < 0.5ms load time

# ══════════════════════════════════════════════════════════════════════════════
#                              MENU STYLING
# ══════════════════════════════════════════════════════════════════════════════

# Enable menu selection
zstyle ':completion:*' menu select

# Use LS_COLORS for file completion colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Format descriptions with Claude colors
zstyle ':completion:*:descriptions' format '%F{#d4a27f}── %d ──%f'

# Format warnings (no matches)
zstyle ':completion:*:warnings' format '%F{#c4746e}◠_◠ No matches found%f'

# Format corrections
zstyle ':completion:*:corrections' format '%F{#8a9a7b}◠‿◠ %d (errors: %e)%f'

# Format messages
zstyle ':completion:*:messages' format '%F{#a292a3}── %d ──%f'

# ══════════════════════════════════════════════════════════════════════════════
#                              GROUPING
# ══════════════════════════════════════════════════════════════════════════════

# Group completions by type
zstyle ':completion:*' group-name ''

# Order of groups
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# ══════════════════════════════════════════════════════════════════════════════
#                              MATCHING & BEHAVIOR
# ══════════════════════════════════════════════════════════════════════════════

# Case-insensitive (all), partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
    clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
    gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
    ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
    operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
    usbmux uucp vcsa wwwrun xfs '_*'

# Kill command completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Man page completion
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# ══════════════════════════════════════════════════════════════════════════════
#                              CACHING
# ══════════════════════════════════════════════════════════════════════════════

# Use caching for slow completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/compcache"

# ══════════════════════════════════════════════════════════════════════════════
#                              SPECIAL COMPLETIONS
# ══════════════════════════════════════════════════════════════════════════════

# SSH/SCP/RSYNC hosts completion
zstyle ':completion:*:(ssh|scp|rsync):*' hosts \
    $(sed -n 's/^Host \([^ *]*\)$/\1/p' ~/.ssh/config 2>/dev/null | tr '\n' ' ')

# Git completion styling
zstyle ':completion:*:git-checkout:*' sort false

# ══════════════════════════════════════════════════════════════════════════════
#                              MENU NAVIGATION
# ══════════════════════════════════════════════════════════════════════════════

# Use hjkl for menu navigation
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enter key accepts and executes in menu
bindkey -M menuselect '^M' .accept-line

# Escape cancels menu selection
bindkey -M menuselect '^[' send-break

# Tab cycles through options
bindkey -M menuselect '^I' menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
