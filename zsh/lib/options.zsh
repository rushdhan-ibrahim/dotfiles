# ══════════════════════════════════════════════════════════════════════════════
#                              ZSH Options
# ══════════════════════════════════════════════════════════════════════════════

# History
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY       # Write timestamps to history
setopt SHARE_HISTORY          # Share history across sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_VERIFY            # Show command before executing from history
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks

# Directory navigation
setopt AUTO_CD                # cd into directory just by typing its name
setopt AUTO_PUSHD             # Push directories onto stack
setopt PUSHD_IGNORE_DUPS      # Don't push duplicates
setopt PUSHD_MINUS            # Swap +/- meanings for pushd
setopt CDABLE_VARS            # cd to named directories

# Globbing and expansion
setopt EXTENDED_GLOB          # Extended globbing
setopt NO_CASE_GLOB           # Case-insensitive globbing
setopt NUMERIC_GLOB_SORT      # Sort numbers numerically

# Correction
setopt CORRECT                # Correct commands
setopt CORRECT_ALL            # Correct all arguments

# Job control
setopt NO_BG_NICE             # Don't nice background jobs
setopt NO_HUP                 # Don't kill background jobs on exit
setopt LONG_LIST_JOBS         # List jobs in long format

# Misc
setopt INTERACTIVE_COMMENTS   # Allow comments in interactive shell
setopt NO_BEEP                # No beeping
