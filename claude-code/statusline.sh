#!/bin/bash
# Claude/Anthropic themed status line
# Warm, muted, earthy tones

# Read JSON input from Claude Code
input=$(cat)

# Parse JSON fields
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
DIR=$(echo "$input" | jq -r '.workspace.current_dir // "~"')
CONTEXT_USED=$(echo "$input" | jq -r '.current_usage.context_window_used // 0')
CONTEXT_MAX=$(echo "$input" | jq -r '.current_usage.context_window_max // 200000')

# Calculate context percentage
if [ "$CONTEXT_MAX" -gt 0 ] 2>/dev/null; then
    CONTEXT_PCT=$((CONTEXT_USED * 100 / CONTEXT_MAX))
else
    CONTEXT_PCT=0
fi

# Get git branch if in a repo
BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    # Check for uncommitted changes
    if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
        BRANCH="${BRANCH}*"
    fi
fi

# Claude/Anthropic themed colors
CORAL="\033[38;2;212;162;127m"     # #d4a27f - Claude coral (main accent)
SAND="\033[38;2;196;178;138m"      # #c4b28a - warm sand
SAGE="\033[38;2;138;154;123m"      # #8a9a7b - muted sage green
TERRA="\033[38;2;196;116;110m"     # #c4746e - terracotta (errors/warnings)
ROSE="\033[38;2;162;146;163m"      # #a292a3 - dusty rose
GRAY="\033[38;2;98;94;90m"         # #625e5a - warm gray (muted text)
RESET="\033[0m"

# Shorten directory (just last 2 components)
SHORT_DIR=$(echo "$DIR" | sed "s|$HOME|~|" | awk -F'/' '{if(NF>2) print $(NF-1)"/"$NF; else print $0}')

# Build status line
OUTPUT=""

# Model with Claude coral
OUTPUT="${CORAL}${MODEL}${RESET}"

# Directory in warm sand
OUTPUT="${OUTPUT}  ${SAND}${SHORT_DIR}${RESET}"

# Git branch in dusty rose
if [ -n "$BRANCH" ]; then
    OUTPUT="${OUTPUT}  ${ROSE}${BRANCH}${RESET}"
fi

# Context usage with color based on percentage
if [ "$CONTEXT_PCT" -lt 50 ]; then
    CTX_COLOR="$SAGE"
elif [ "$CONTEXT_PCT" -lt 80 ]; then
    CTX_COLOR="$SAND"
else
    CTX_COLOR="$TERRA"
fi
OUTPUT="${OUTPUT}  ${CTX_COLOR}${CONTEXT_PCT}%${RESET}"

echo -e "$OUTPUT"
