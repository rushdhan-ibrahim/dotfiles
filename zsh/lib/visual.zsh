# ══════════════════════════════════════════════════════════════════════════════
#                              The Visual System
#                        Claude's Living Color Palette
# ══════════════════════════════════════════════════════════════════════════════
# This file is the foundation of the visual experience.
# It exports colors, provides time-aware functions, and defines Claude's personality.
#
# Performance target: < 1ms load time

# ══════════════════════════════════════════════════════════════════════════════
#                              THE CLAUDE PALETTE
# ══════════════════════════════════════════════════════════════════════════════

# Background and foreground
export CLAUDE_BG="#1a1816"
export CLAUDE_FG="#e8dfd6"

# Primary accent colors
export CLAUDE_CORAL="#d4a27f"           # Warm, inviting - terminal primary
export CLAUDE_TEAL="#8ea4a2"            # Calm, focused - Claude Code primary
export CLAUDE_TERRACOTTA="#c4746e"      # Powerful, attention
export CLAUDE_SAND="#c4b28a"            # Neutral, directories
export CLAUDE_SAGE="#8a9a7b"            # Natural, success
export CLAUDE_DUSTY_ROSE="#a292a3"      # Elegant, keywords

# Supporting colors
export CLAUDE_WARM_GRAY="#625e5a"       # Comments, muted
export CLAUDE_DIM="#4a4745"             # Build artifacts, noise
export CLAUDE_PEACH="#e8b89d"           # Numbers, dawn
export CLAUDE_BRIGHT_SAND="#d4c29a"     # Afternoon accent

# Extended palette for special cases
export CLAUDE_SELECTION="#2a2725"       # Selection background
export CLAUDE_CURSOR="#e8dfd6"          # Cursor color
export CLAUDE_ERROR="#c4746e"           # Error (same as terracotta)
export CLAUDE_WARNING="#c4b28a"         # Warning (same as sand)
export CLAUDE_SUCCESS="#8a9a7b"         # Success (same as sage)
export CLAUDE_INFO="#8ea4a2"            # Info (same as teal)

# ══════════════════════════════════════════════════════════════════════════════
#                              ANSI COLOR CODES
# ══════════════════════════════════════════════════════════════════════════════
# For use in prompts and scripts that need ANSI escape codes

# True color (24-bit) codes
export CLAUDE_CORAL_ANSI='\033[38;2;212;162;127m'
export CLAUDE_TEAL_ANSI='\033[38;2;142;164;162m'
export CLAUDE_TERRACOTTA_ANSI='\033[38;2;196;116;110m'
export CLAUDE_SAND_ANSI='\033[38;2;196;178;138m'
export CLAUDE_SAGE_ANSI='\033[38;2;138;154;123m'
export CLAUDE_DUSTY_ROSE_ANSI='\033[38;2;162;146;163m'
export CLAUDE_WARM_GRAY_ANSI='\033[38;2;98;94;90m'
export CLAUDE_DIM_ANSI='\033[38;2;74;71;69m'
export CLAUDE_FG_ANSI='\033[38;2;232;223;214m'
export CLAUDE_RESET='\033[0m'

# Bold variants
export CLAUDE_CORAL_BOLD='\033[1;38;2;212;162;127m'
export CLAUDE_TEAL_BOLD='\033[1;38;2;142;164;162m'
export CLAUDE_SAGE_BOLD='\033[1;38;2;138;154;123m'
export CLAUDE_TERRACOTTA_BOLD='\033[1;38;2;196;116;110m'

# ══════════════════════════════════════════════════════════════════════════════
#                              TIME-AWARE COLORS
# ══════════════════════════════════════════════════════════════════════════════
# The prompt accent color breathes with the rhythm of the day

claude_time_accent() {
    local hour=$(date +%H)
    case $hour in
        0[5-7])   echo "#e8b89d" ;;  # Dawn (05-07): Soft peach
        0[8-9])   echo "#d4a27f" ;;  # Early morning (08-09): Warm coral
        1[0-1])   echo "#d4a27f" ;;  # Late morning (10-11): Warm coral
        1[2-6])   echo "#d4c29a" ;;  # Afternoon (12-16): Bright sand
        1[7-9])   echo "#c4746e" ;;  # Evening (17-19): Muted terracotta
        2[0-2])   echo "#a292a3" ;;  # Night (20-22): Dusty rose
        *)        echo "#6e8482" ;;  # Late night (23-04): Subdued teal
    esac
}

# Get time period name for greetings
claude_time_period() {
    local hour=$(date +%H)
    case $hour in
        0[5-7])   echo "dawn" ;;
        0[8-9]|1[0-1]) echo "morning" ;;
        1[2-6])   echo "afternoon" ;;
        1[7-9])   echo "evening" ;;
        2[0-2])   echo "night" ;;
        *)        echo "late_night" ;;
    esac
}

# ══════════════════════════════════════════════════════════════════════════════
#                              SEASON DETECTION
# ══════════════════════════════════════════════════════════════════════════════
# Subtle seasonal awareness for personality and greetings

claude_season() {
    local month=$(date +%m)
    case $month in
        0[3-5]) echo "spring" ;;
        0[6-8]) echo "summer" ;;
        09|1[0-1]) echo "autumn" ;;
        *) echo "winter" ;;
    esac
}

# Seasonal accent overlay (subtle tint)
claude_seasonal_tint() {
    case $(claude_season) in
        spring) echo "#98c379" ;;  # Fresh green
        summer) echo "#e5c07b" ;;  # Warm gold
        autumn) echo "#d19a66" ;;  # Rich amber
        winter) echo "#8ea4a2" ;;  # Cool teal
    esac
}

# Seasonal icon for decorations
claude_seasonal_icon() {
    case $(claude_season) in
        spring) echo "✿" ;;
        summer) echo "☀" ;;
        autumn) echo "🍂" ;;
        winter) echo "❄" ;;
    esac
}

# ══════════════════════════════════════════════════════════════════════════════
#                              CONTEXTUAL GREETINGS
# ══════════════════════════════════════════════════════════════════════════════
# Personality-driven greetings based on time and season

claude_greeting() {
    local hour=$(date +%H)
    local day=$(date +%u)
    local season=$(claude_season)

    # Weekend special
    if [[ $day -ge 6 ]]; then
        echo "Weekend mode. Explore freely."
        return
    fi

    # Time-based greetings
    case $hour in
        0[5-7])
            echo "Dawn breaks. A fresh canvas awaits."
            ;;
        0[8-9]|1[0-1])
            echo "Good morning. Ready to create something wonderful?"
            ;;
        1[2-3])
            echo "The afternoon unfolds. What shall we build?"
            ;;
        1[4-6])
            echo "Deep in the day. Your focus is powerful."
            ;;
        1[7-9])
            echo "Evening approaches. Time for focused work."
            ;;
        2[0-2])
            echo "The quiet hours. When great things are made."
            ;;
        *)
            echo "The world sleeps. But we create."
            ;;
    esac
}

# Seasonal greeting for neofetch
claude_seasonal_greeting() {
    case $(claude_season) in
        spring) echo "New growth begins. What will you cultivate?" ;;
        summer) echo "Long days ahead. Make them count." ;;
        autumn) echo "Harvest season. Gather your creations." ;;
        winter) echo "The quiet months. Deep work awaits." ;;
    esac
}

# ══════════════════════════════════════════════════════════════════════════════
#                              CLAUDE PERSONALITY
# ══════════════════════════════════════════════════════════════════════════════
# The expressive faces of Claude

export CLAUDE_FACE_IDLE="◠◡◠"
export CLAUDE_FACE_THINKING="◠◡◠ ···"
export CLAUDE_FACE_HAPPY="◠‿◠"
export CLAUDE_FACE_CONCERN="◠_◠"
export CLAUDE_FACE_WORKING="◠·◠"
export CLAUDE_FACE_GREETING="◠◡◠"

# Get Claude face based on state
claude_face() {
    local state="${1:-idle}"
    case $state in
        thinking) echo "$CLAUDE_FACE_THINKING" ;;
        happy|success) echo "$CLAUDE_FACE_HAPPY" ;;
        concern|error) echo "$CLAUDE_FACE_CONCERN" ;;
        working) echo "$CLAUDE_FACE_WORKING" ;;
        *) echo "$CLAUDE_FACE_IDLE" ;;
    esac
}

# ══════════════════════════════════════════════════════════════════════════════
#                              GIT STATUS POETRY
# ══════════════════════════════════════════════════════════════════════════════
# Poetic git status symbols

export GIT_CLEAN="✓"           # All is well
export GIT_STAGED="✦"          # Ready to commit
export GIT_MODIFIED=""         # Work in progress
export GIT_UNTRACKED=""        # New, unborn
export GIT_AHEAD="⇡"           # Commits to push
export GIT_BEHIND="⇣"          # Commits to pull
export GIT_CONFLICT="↯"        # Attention needed
export GIT_STASHED="≡"         # Work saved aside

# ══════════════════════════════════════════════════════════════════════════════
#                              TERMINAL DETECTION
# ══════════════════════════════════════════════════════════════════════════════
# Detect terminal capabilities

claude_supports_truecolor() {
    [[ "$COLORTERM" == "truecolor" ]] || [[ "$COLORTERM" == "24bit" ]] || \
    [[ "$TERM_PROGRAM" == "iTerm.app" ]] || [[ "$TERM_PROGRAM" == "WezTerm" ]] || \
    [[ "$TERM_PROGRAM" == "Alacritty" ]] || [[ -n "$KITTY_WINDOW_ID" ]]
}

claude_terminal_width() {
    echo "${COLUMNS:-$(tput cols 2>/dev/null || echo 80)}"
}

# Choose ASCII art variant based on terminal width
claude_ascii_variant() {
    local width=$(claude_terminal_width)
    if [[ $width -ge 120 ]]; then
        echo "elaborate"
    elif [[ $width -ge 80 ]]; then
        echo "friendly"
    else
        echo "minimal"
    fi
}

# ══════════════════════════════════════════════════════════════════════════════
#                              ENVIRONMENT DETECTION
# ══════════════════════════════════════════════════════════════════════════════

# Check if we're in Claude Code
in_claude_code() {
    [[ -n "$CLAUDE_CODE" ]] || [[ -n "$CLAUDE_SESSION_ID" ]]
}

# Check if we're in SSH
in_ssh() {
    [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]
}

# Check if we're root
is_root() {
    [[ $EUID -eq 0 ]]
}

# Check if we're in a git repo
in_git_repo() {
    git rev-parse --git-dir &>/dev/null
}

# Check if we're in a Python virtualenv
in_virtualenv() {
    [[ -n "$VIRTUAL_ENV" ]]
}

# ══════════════════════════════════════════════════════════════════════════════
#                              HELPER FUNCTIONS
# ══════════════════════════════════════════════════════════════════════════════

# Print colored text
claude_print() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${CLAUDE_RESET}"
}

# Print success message with happy face
claude_success() {
    echo -e "${CLAUDE_SAGE_ANSI}${CLAUDE_FACE_HAPPY}${CLAUDE_RESET} $1"
}

# Print error message with concern face
claude_error() {
    echo -e "${CLAUDE_TERRACOTTA_ANSI}${CLAUDE_FACE_CONCERN}${CLAUDE_RESET} $1"
}

# Print info message
claude_info() {
    echo -e "${CLAUDE_TEAL_ANSI}${CLAUDE_FACE_IDLE}${CLAUDE_RESET} $1"
}

# ══════════════════════════════════════════════════════════════════════════════
#                              PROMPT HELPERS
# ══════════════════════════════════════════════════════════════════════════════

# Format command duration nicely
claude_duration() {
    local seconds="$1"
    if [[ $seconds -lt 1 ]]; then
        echo ""
    elif [[ $seconds -lt 60 ]]; then
        printf "%.1fs" "$seconds"
    elif [[ $seconds -lt 3600 ]]; then
        printf "%dm %ds" $((seconds / 60)) $((seconds % 60))
    else
        printf "%dh %dm" $((seconds / 3600)) $(((seconds % 3600) / 60))
    fi
}

# Execution feedback dot indicator
claude_exec_dots() {
    local ms="$1"
    if [[ $ms -lt 100 ]]; then
        echo ""
    elif [[ $ms -lt 1000 ]]; then
        echo "·"
    elif [[ $ms -lt 10000 ]]; then
        echo "··"
    else
        echo "···"
    fi
}
