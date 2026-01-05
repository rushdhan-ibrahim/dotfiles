# ══════════════════════════════════════════════════════════════════════════════
#                              Functions
# ══════════════════════════════════════════════════════════════════════════════

# === Directory Operations ===

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Create a temporary directory and cd into it
tmpd() {
    local dir
    dir=$(mktemp -d)
    echo "Created: $dir"
    cd "$dir"
}

# === Archive Operations ===

# Extract any archive
extract() {
    if [[ -z "$1" ]]; then
        echo "Usage: extract <file>"
        return 1
    fi

    if [[ ! -f "$1" ]]; then
        echo "Error: '$1' is not a file"
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.tar.xz)    tar xJf "$1"     ;;
        *.tar.zst)   tar --zstd -xf "$1" ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar x "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *)           echo "Unknown archive format: '$1'" ;;
    esac
}

# === Quick Utilities ===

# Quick notes
note() {
    local notes_file="$HOME/notes.md"
    if [[ -z "$1" ]]; then
        $EDITOR "$notes_file"
    else
        echo "- $(date '+%Y-%m-%d %H:%M'): $*" >> "$notes_file"
        echo "Note added!"
    fi
}

# Weather in terminal
weather() {
    curl -s "wttr.in/${1:-}?format=3"
}

# Detailed weather
weatherfull() {
    curl -s "wttr.in/${1:-}"
}

# Cheatsheet lookup
cheat() {
    curl -s "cheat.sh/$1"
}

# === Process Management ===

# Find process by name
psg() {
    ps aux | rg -i "$1" | rg -v "rg -i $1"
}

# Kill process by port
killport() {
    if [[ -z "$1" ]]; then
        echo "Usage: killport <port>"
        return 1
    fi
    lsof -ti ":$1" | xargs kill -9 2>/dev/null && echo "Killed process on port $1" || echo "No process on port $1"
}

# === Network ===

# Quick HTTP server
serve() {
    local port="${1:-8000}"
    echo "Serving on http://localhost:$port"
    python3 -m http.server "$port"
}

# Check if a URL is up
isup() {
    curl -s --head "$1" | head -n 1
}

# === Development Helpers ===

# Quick git commit with message
gac() {
    git add --all && git commit -m "$*"
}

# Git push with upstream
gpu() {
    git push -u origin "$(git branch --show-current)"
}

# Find files by name
ff() {
    fd --type f "$1"
}

# Find directories by name
fdir() {
    fd --type d "$1"
}

# === Misc ===

# Calculator
calc() {
    echo "$*" | bc -l
}

# Generate random string
randstr() {
    local len="${1:-32}"
    openssl rand -base64 "$len" | tr -d '\n' | head -c "$len"
    echo
}

# UUID generator
uuid() {
    uuidgen | tr '[:upper:]' '[:lower:]'
}

# JSON pretty print
jsonpp() {
    if [[ -z "$1" ]]; then
        jq '.'
    else
        cat "$1" | jq '.'
    fi
}

# Show disk usage for current directory
duh() {
    du -h -d 1 "${1:-.}" | sort -h
}
