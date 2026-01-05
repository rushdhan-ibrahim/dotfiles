# ══════════════════════════════════════════════════════════════════════════════
#                              Login Shell Config
#                        (Loaded once on login sessions)
# ══════════════════════════════════════════════════════════════════════════════

# Homebrew (ensure it's available)
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
