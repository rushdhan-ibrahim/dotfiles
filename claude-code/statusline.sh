#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
#                              Claude Code Statusline
#                            The Teal Realm Experience
# ══════════════════════════════════════════════════════════════════════════════
#
# Design:
# ╭──────────────────────────────────────────────────────────────╮
# │   Claude   │  ~/project  │   main  │  ◠◡◠ Ready  │
# ╰──────────────────────────────────────────────────────────────╯
#
# The Claude Code realm uses TEAL as primary accent (vs terminal's CORAL)
# This signals: "We're collaborating now. I'm your focused partner."
#
# Dynamic States:
#   ◠◡◠       → Idle, ready to help
#   ◠◡◠ ···   → Thinking
#   ◠‿◠       → Task complete, satisfied
#   ◠_◠       → Encountered an issue
#   ◠·◠       → Processing, focused

# ══════════════════════════════════════════════════════════════════════════════
#                              INPUT PARSING
# ══════════════════════════════════════════════════════════════════════════════

# Read JSON input from Claude Code
input=$(cat)

# Parse JSON fields with defaults
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
DIR=$(echo "$input" | jq -r '.workspace.current_dir // "~"')

# Context window: sum input + cache tokens for total usage
CONTEXT_USED=$(echo "$input" | jq -r '
  .context_window.current_usage as $u |
  if $u then
    (($u.input_tokens // 0) + ($u.cache_creation_input_tokens // 0) + ($u.cache_read_input_tokens // 0))
  else 0 end
')
CONTEXT_MAX=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
IS_BUSY=$(echo "$input" | jq -r '.is_busy // false')

# ══════════════════════════════════════════════════════════════════════════════
#                              CALCULATIONS
# ══════════════════════════════════════════════════════════════════════════════

# Calculate context percentage
if [ "$CONTEXT_MAX" -gt 0 ] 2>/dev/null; then
    CONTEXT_PCT=$((CONTEXT_USED * 100 / CONTEXT_MAX))
else
    CONTEXT_PCT=0
fi

# Get git branch if in a repo
BRANCH=""
GIT_STATUS=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)

    # Check for git status
    if ! git diff --quiet 2>/dev/null; then
        GIT_STATUS=" "  # Modified
    elif ! git diff --cached --quiet 2>/dev/null; then
        GIT_STATUS="✦"   # Staged
    fi
fi

# Shorten directory (just last 2 components, replace home with ~)
SHORT_DIR=$(echo "$DIR" | sed "s|$HOME|~|" | awk -F'/' '{
    if(NF>2) print $(NF-1)"/"$NF;
    else print $0
}')

# ══════════════════════════════════════════════════════════════════════════════
#                              CLAUDE PALETTE - TEAL REALM
# ══════════════════════════════════════════════════════════════════════════════

# Primary: Teal (Claude Code's signature color)
TEAL="\033[38;2;142;164;162m"         # #8ea4a2 - calm, focused

# Supporting colors
CORAL="\033[38;2;212;162;127m"        # #d4a27f - warm accent
SAND="\033[38;2;196;178;138m"         # #c4b28a - directories
SAGE="\033[38;2;138;154;123m"         # #8a9a7b - success
TERRA="\033[38;2;196;116;110m"        # #c4746e - warnings/errors
ROSE="\033[38;2;162;146;163m"         # #a292a3 - git branch
GRAY="\033[38;2;98;94;90m"            # #625e5a - muted text
DIM="\033[38;2;74;71;69m"             # #4a4745 - borders

# Text styles
BOLD="\033[1m"
RESET="\033[0m"

# ══════════════════════════════════════════════════════════════════════════════
#                              CLAUDE FACE STATES
# ══════════════════════════════════════════════════════════════════════════════

FACE_IDLE="◠◡◠"
FACE_THINKING="◠◡◠ ···"
FACE_HAPPY="◠‿◠"
FACE_CONCERN="◠_◠"
FACE_WORKING="◠·◠"

# Determine current face based on state
if [ "$IS_BUSY" = "true" ]; then
    CLAUDE_FACE="$FACE_WORKING"
    FACE_STATUS="Processing"
else
    CLAUDE_FACE="$FACE_IDLE"
    FACE_STATUS="Ready"
fi

# ══════════════════════════════════════════════════════════════════════════════
#                              STATUS LINE BUILDING
# ══════════════════════════════════════════════════════════════════════════════

# Context color based on usage
if [ "$CONTEXT_PCT" -lt 50 ]; then
    CTX_COLOR="$SAGE"
elif [ "$CONTEXT_PCT" -lt 75 ]; then
    CTX_COLOR="$SAND"
elif [ "$CONTEXT_PCT" -lt 90 ]; then
    CTX_COLOR="$CORAL"
else
    CTX_COLOR="$TERRA"
fi

# Build the status line components
OUTPUT=""

# Model name in teal (primary Claude Code color)
OUTPUT="${TEAL}${BOLD} ${MODEL}${RESET}"

# Directory in sand
OUTPUT="${OUTPUT}  ${SAND} ${SHORT_DIR}${RESET}"

# Git branch in dusty rose (if present)
if [ -n "$BRANCH" ]; then
    OUTPUT="${OUTPUT}  ${ROSE} ${BRANCH}${GIT_STATUS}${RESET}"
fi

# Context usage indicator (with icon)
OUTPUT="${OUTPUT}  ${CTX_COLOR}◐ ${CONTEXT_PCT}%${RESET}"

# Claude face and status
OUTPUT="${OUTPUT}  ${TEAL}${CLAUDE_FACE}${RESET} ${GRAY}${FACE_STATUS}${RESET}"

# Output the final status line
echo -e "$OUTPUT"
