# ══════════════════════════════════════════════════════════════════════════════
#                              LS_COLORS Taxonomy
#                        150+ File Types with Semantic Meaning
# ══════════════════════════════════════════════════════════════════════════════
# This file defines colors for file types in ls, eza, and other tools.
# Colors are from the Claude palette with semantic meaning.
#
# Performance target: < 0.5ms load time
#
# Color Philosophy:
#   Directories   → Sand #c4b28a       (inviting, explorable)
#   Executables   → Sage #8a9a7b       (action, go)
#   Symlinks      → Teal #8ea4a2       (connection, reference)
#   Archives      → Terracotta #c4746e (bundled, compressed)
#   Media         → Dusty Rose #a292a3 (creative, artistic)
#   Documents     → Coral #d4a27f      (warm, readable)
#   Config        → Warm Gray #625e5a  (meta, system)
#   Build/Cache   → Dim #4a4745        (noise, generated)
#   Secrets       → Terracotta dim     (caution, sensitive)

# ══════════════════════════════════════════════════════════════════════════════
#                              COLOR DEFINITIONS
# ══════════════════════════════════════════════════════════════════════════════
# Using 24-bit true color format: 38;2;R;G;B

# Core colors
local sand="38;2;196;178;138"          # #c4b28a - Directories
local sage="38;2;138;154;123"          # #8a9a7b - Executables
local teal="38;2;142;164;162"          # #8ea4a2 - Symlinks
local terracotta="38;2;196;116;110"    # #c4746e - Archives
local dusty_rose="38;2;162;146;163"    # #a292a3 - Media
local coral="38;2;212;162;127"         # #d4a27f - Documents
local warm_gray="38;2;98;94;90"        # #625e5a - Config
local dim="38;2;74;71;69"              # #4a4745 - Build artifacts
local fg="38;2;232;223;214"            # #e8dfd6 - Default

# Language-specific accents
local js_color="38;2;212;162;127"      # Coral - JavaScript/TypeScript
local py_color="38;2;138;154;123"      # Sage - Python
local rs_color="38;2;196;116;110"      # Terracotta - Rust
local go_color="38;2;142;164;162"      # Teal - Go
local rb_color="38;2;162;146;163"      # Dusty Rose - Ruby
local lua_color="38;2;196;178;138"     # Sand - Lua/Shell
local java_color="38;2;212;162;127"    # Coral - Java
local c_color="38;2;142;164;162"       # Teal - C/C++

# Style modifiers
local bold="1"
local italic="3"
local underline="4"

# ══════════════════════════════════════════════════════════════════════════════
#                              LS_COLORS DEFINITION
# ══════════════════════════════════════════════════════════════════════════════

export LS_COLORS=""

# ─────────────────────────────────────────────────────────────────────────────
#                              CORE FILE TYPES
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="di=${bold};${sand}:"         # Directories
LS_COLORS+="ex=${sage}:"                  # Executables
LS_COLORS+="ln=${teal}:"                  # Symlinks
LS_COLORS+="or=${terracotta};${italic}:"  # Orphaned symlinks
LS_COLORS+="mi=${terracotta}:"            # Missing symlink target
LS_COLORS+="pi=${teal}:"                  # Named pipes (FIFO)
LS_COLORS+="so=${teal}:"                  # Sockets
LS_COLORS+="bd=${teal}:"                  # Block devices
LS_COLORS+="cd=${teal}:"                  # Character devices
LS_COLORS+="su=${terracotta};${bold}:"    # Setuid files
LS_COLORS+="sg=${terracotta}:"            # Setgid files
LS_COLORS+="tw=${sand};${underline}:"     # Sticky other-writable dirs
LS_COLORS+="ow=${sand}:"                  # Other-writable dirs
LS_COLORS+="st=${sand};${bold}:"          # Sticky dirs

# ─────────────────────────────────────────────────────────────────────────────
#                              ARCHIVES & COMPRESSED
# ─────────────────────────────────────────────────────────────────────────────

# Compressed files
LS_COLORS+="*.zip=${terracotta}:"
LS_COLORS+="*.tar=${terracotta}:"
LS_COLORS+="*.gz=${terracotta}:"
LS_COLORS+="*.bz2=${terracotta}:"
LS_COLORS+="*.xz=${terracotta}:"
LS_COLORS+="*.lz=${terracotta}:"
LS_COLORS+="*.lzma=${terracotta}:"
LS_COLORS+="*.lzo=${terracotta}:"
LS_COLORS+="*.zst=${terracotta}:"
LS_COLORS+="*.7z=${terracotta}:"
LS_COLORS+="*.rar=${terracotta}:"
LS_COLORS+="*.cab=${terracotta}:"

# Archive combinations
LS_COLORS+="*.tar.gz=${terracotta}:"
LS_COLORS+="*.tgz=${terracotta}:"
LS_COLORS+="*.tar.bz2=${terracotta}:"
LS_COLORS+="*.tbz=${terracotta}:"
LS_COLORS+="*.tar.xz=${terracotta}:"
LS_COLORS+="*.txz=${terracotta}:"
LS_COLORS+="*.tar.zst=${terracotta}:"

# Package formats
LS_COLORS+="*.deb=${terracotta}:"
LS_COLORS+="*.rpm=${terracotta}:"
LS_COLORS+="*.pkg=${terracotta}:"
LS_COLORS+="*.dmg=${terracotta}:"
LS_COLORS+="*.iso=${terracotta}:"
LS_COLORS+="*.img=${terracotta}:"
LS_COLORS+="*.apk=${terracotta}:"
LS_COLORS+="*.ipa=${terracotta}:"
LS_COLORS+="*.jar=${terracotta}:"
LS_COLORS+="*.war=${terracotta}:"
LS_COLORS+="*.ear=${terracotta}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              DOCUMENTS
# ─────────────────────────────────────────────────────────────────────────────

# Markdown and text
LS_COLORS+="*.md=${coral}:"
LS_COLORS+="*.markdown=${coral}:"
LS_COLORS+="*.mdx=${coral}:"
LS_COLORS+="*.txt=${coral}:"
LS_COLORS+="*.text=${coral}:"
LS_COLORS+="*.org=${coral}:"
LS_COLORS+="*.rst=${coral}:"
LS_COLORS+="*.adoc=${coral}:"
LS_COLORS+="*.asciidoc=${coral}:"

# Office documents
LS_COLORS+="*.pdf=${coral}:"
LS_COLORS+="*.doc=${coral}:"
LS_COLORS+="*.docx=${coral}:"
LS_COLORS+="*.xls=${coral}:"
LS_COLORS+="*.xlsx=${coral}:"
LS_COLORS+="*.ppt=${coral}:"
LS_COLORS+="*.pptx=${coral}:"
LS_COLORS+="*.odt=${coral}:"
LS_COLORS+="*.ods=${coral}:"
LS_COLORS+="*.odp=${coral}:"
LS_COLORS+="*.rtf=${coral}:"

# eBooks
LS_COLORS+="*.epub=${coral}:"
LS_COLORS+="*.mobi=${coral}:"
LS_COLORS+="*.azw=${coral}:"
LS_COLORS+="*.azw3=${coral}:"

# Special documents (bold)
LS_COLORS+="*README=${bold};${coral}:"
LS_COLORS+="*README.md=${bold};${coral}:"
LS_COLORS+="*README.txt=${bold};${coral}:"
LS_COLORS+="*LICENSE=${dusty_rose}:"
LS_COLORS+="*LICENSE.md=${dusty_rose}:"
LS_COLORS+="*LICENSE.txt=${dusty_rose}:"
LS_COLORS+="*COPYING=${dusty_rose}:"
LS_COLORS+="*CHANGELOG=${coral}:"
LS_COLORS+="*CHANGELOG.md=${coral}:"
LS_COLORS+="*AUTHORS=${coral}:"
LS_COLORS+="*CONTRIBUTORS=${coral}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              MEDIA - IMAGES
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.jpg=${dusty_rose}:"
LS_COLORS+="*.jpeg=${dusty_rose}:"
LS_COLORS+="*.png=${dusty_rose}:"
LS_COLORS+="*.gif=${dusty_rose}:"
LS_COLORS+="*.bmp=${dusty_rose}:"
LS_COLORS+="*.tiff=${dusty_rose}:"
LS_COLORS+="*.tif=${dusty_rose}:"
LS_COLORS+="*.webp=${dusty_rose}:"
LS_COLORS+="*.ico=${dusty_rose}:"
LS_COLORS+="*.svg=${dusty_rose}:"
LS_COLORS+="*.svgz=${dusty_rose}:"
LS_COLORS+="*.heic=${dusty_rose}:"
LS_COLORS+="*.heif=${dusty_rose}:"
LS_COLORS+="*.avif=${dusty_rose}:"
LS_COLORS+="*.raw=${dusty_rose}:"
LS_COLORS+="*.cr2=${dusty_rose}:"
LS_COLORS+="*.nef=${dusty_rose}:"
LS_COLORS+="*.psd=${dusty_rose}:"
LS_COLORS+="*.ai=${dusty_rose}:"
LS_COLORS+="*.eps=${dusty_rose}:"
LS_COLORS+="*.xcf=${dusty_rose}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              MEDIA - AUDIO
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.mp3=${dusty_rose}:"
LS_COLORS+="*.flac=${dusty_rose}:"
LS_COLORS+="*.m4a=${dusty_rose}:"
LS_COLORS+="*.aac=${dusty_rose}:"
LS_COLORS+="*.ogg=${dusty_rose}:"
LS_COLORS+="*.opus=${dusty_rose}:"
LS_COLORS+="*.wav=${dusty_rose}:"
LS_COLORS+="*.wma=${dusty_rose}:"
LS_COLORS+="*.aiff=${dusty_rose}:"
LS_COLORS+="*.mid=${dusty_rose}:"
LS_COLORS+="*.midi=${dusty_rose}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              MEDIA - VIDEO
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.mp4=${dusty_rose}:"
LS_COLORS+="*.mkv=${dusty_rose}:"
LS_COLORS+="*.avi=${dusty_rose}:"
LS_COLORS+="*.mov=${dusty_rose}:"
LS_COLORS+="*.wmv=${dusty_rose}:"
LS_COLORS+="*.flv=${dusty_rose}:"
LS_COLORS+="*.webm=${dusty_rose}:"
LS_COLORS+="*.m4v=${dusty_rose}:"
LS_COLORS+="*.mpg=${dusty_rose}:"
LS_COLORS+="*.mpeg=${dusty_rose}:"
LS_COLORS+="*.3gp=${dusty_rose}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - JavaScript/TypeScript
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.js=${js_color}:"
LS_COLORS+="*.mjs=${js_color}:"
LS_COLORS+="*.cjs=${js_color}:"
LS_COLORS+="*.jsx=${js_color}:"
LS_COLORS+="*.ts=${js_color}:"
LS_COLORS+="*.tsx=${js_color}:"
LS_COLORS+="*.mts=${js_color}:"
LS_COLORS+="*.cts=${js_color}:"
LS_COLORS+="*.vue=${js_color}:"
LS_COLORS+="*.svelte=${js_color}:"
LS_COLORS+="*.astro=${js_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Python
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.py=${py_color}:"
LS_COLORS+="*.pyw=${py_color}:"
LS_COLORS+="*.pyx=${py_color}:"
LS_COLORS+="*.pxd=${py_color}:"
LS_COLORS+="*.pyi=${py_color}:"
LS_COLORS+="*.ipynb=${py_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Rust
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.rs=${rs_color}:"
LS_COLORS+="*.rlib=${rs_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Go
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.go=${go_color}:"
LS_COLORS+="*.mod=${go_color}:"
LS_COLORS+="*.sum=${go_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Ruby
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.rb=${rb_color}:"
LS_COLORS+="*.erb=${rb_color}:"
LS_COLORS+="*.rake=${rb_color}:"
LS_COLORS+="*.gemspec=${rb_color}:"
LS_COLORS+="*Gemfile=${rb_color}:"
LS_COLORS+="*Rakefile=${rb_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Shell/Lua
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.sh=${lua_color}:"
LS_COLORS+="*.bash=${lua_color}:"
LS_COLORS+="*.zsh=${lua_color}:"
LS_COLORS+="*.fish=${lua_color}:"
LS_COLORS+="*.lua=${lua_color}:"
LS_COLORS+="*.vim=${lua_color}:"
LS_COLORS+="*.awk=${lua_color}:"
LS_COLORS+="*.sed=${lua_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Java/JVM
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.java=${java_color}:"
LS_COLORS+="*.class=${java_color}:"
LS_COLORS+="*.kt=${java_color}:"
LS_COLORS+="*.kts=${java_color}:"
LS_COLORS+="*.scala=${java_color}:"
LS_COLORS+="*.clj=${java_color}:"
LS_COLORS+="*.cljs=${java_color}:"
LS_COLORS+="*.groovy=${java_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - C/C++
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.c=${c_color}:"
LS_COLORS+="*.h=${c_color}:"
LS_COLORS+="*.cpp=${c_color}:"
LS_COLORS+="*.cc=${c_color}:"
LS_COLORS+="*.cxx=${c_color}:"
LS_COLORS+="*.hpp=${c_color}:"
LS_COLORS+="*.hh=${c_color}:"
LS_COLORS+="*.hxx=${c_color}:"
LS_COLORS+="*.m=${c_color}:"
LS_COLORS+="*.mm=${c_color}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SOURCE CODE - Other Languages
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.cs=${teal}:"             # C#
LS_COLORS+="*.fs=${teal}:"             # F#
LS_COLORS+="*.swift=${teal}:"          # Swift
LS_COLORS+="*.dart=${teal}:"           # Dart
LS_COLORS+="*.php=${dusty_rose}:"      # PHP
LS_COLORS+="*.pl=${sage}:"             # Perl
LS_COLORS+="*.pm=${sage}:"             # Perl module
LS_COLORS+="*.r=${sage}:"              # R
LS_COLORS+="*.R=${sage}:"              # R
LS_COLORS+="*.hs=${dusty_rose}:"       # Haskell
LS_COLORS+="*.lhs=${dusty_rose}:"      # Literate Haskell
LS_COLORS+="*.ml=${teal}:"             # OCaml
LS_COLORS+="*.mli=${teal}:"            # OCaml interface
LS_COLORS+="*.ex=${dusty_rose}:"       # Elixir
LS_COLORS+="*.exs=${dusty_rose}:"      # Elixir script
LS_COLORS+="*.erl=${dusty_rose}:"      # Erlang
LS_COLORS+="*.hrl=${dusty_rose}:"      # Erlang header
LS_COLORS+="*.nim=${sage}:"            # Nim
LS_COLORS+="*.zig=${teal}:"            # Zig
LS_COLORS+="*.v=${sage}:"              # V / Vlang

# ─────────────────────────────────────────────────────────────────────────────
#                              WEB & MARKUP
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.html=${coral}:"
LS_COLORS+="*.htm=${coral}:"
LS_COLORS+="*.xhtml=${coral}:"
LS_COLORS+="*.css=${dusty_rose}:"
LS_COLORS+="*.scss=${dusty_rose}:"
LS_COLORS+="*.sass=${dusty_rose}:"
LS_COLORS+="*.less=${dusty_rose}:"
LS_COLORS+="*.styl=${dusty_rose}:"
LS_COLORS+="*.xml=${coral}:"
LS_COLORS+="*.xsl=${coral}:"
LS_COLORS+="*.xslt=${coral}:"
LS_COLORS+="*.wasm=${teal}:"
LS_COLORS+="*.wat=${teal}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              CONFIGURATION FILES
# ─────────────────────────────────────────────────────────────────────────────

# JSON family
LS_COLORS+="*.json=${warm_gray}:"
LS_COLORS+="*.json5=${warm_gray}:"
LS_COLORS+="*.jsonc=${warm_gray}:"
LS_COLORS+="*.geojson=${warm_gray}:"

# YAML family
LS_COLORS+="*.yaml=${warm_gray}:"
LS_COLORS+="*.yml=${warm_gray}:"

# TOML
LS_COLORS+="*.toml=${warm_gray}:"

# INI style
LS_COLORS+="*.ini=${warm_gray}:"
LS_COLORS+="*.cfg=${warm_gray}:"
LS_COLORS+="*.conf=${warm_gray}:"
LS_COLORS+="*.config=${warm_gray}:"
LS_COLORS+="*.properties=${warm_gray}:"

# Editor/IDE configs
LS_COLORS+="*.editorconfig=${warm_gray}:"
LS_COLORS+=".editorconfig=${warm_gray}:"
LS_COLORS+="*.prettierrc=${warm_gray}:"
LS_COLORS+="*.eslintrc=${warm_gray}:"
LS_COLORS+="*.stylelintrc=${warm_gray}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SPECIAL CONFIG FILES
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*Makefile=${sage}:"
LS_COLORS+="*Dockerfile=${teal}:"
LS_COLORS+="*docker-compose.yml=${teal}:"
LS_COLORS+="*docker-compose.yaml=${teal}:"
LS_COLORS+="*.dockerfile=${teal}:"
LS_COLORS+="*Vagrantfile=${teal}:"
LS_COLORS+="*Brewfile=${sage}:"
LS_COLORS+="*Procfile=${sage}:"

# Package managers
LS_COLORS+="*package.json=${coral}:"
LS_COLORS+="*package-lock.json=${dim}:"
LS_COLORS+="*yarn.lock=${dim}:"
LS_COLORS+="*pnpm-lock.yaml=${dim}:"
LS_COLORS+="*Cargo.toml=${rs_color}:"
LS_COLORS+="*Cargo.lock=${dim}:"
LS_COLORS+="*go.mod=${go_color}:"
LS_COLORS+="*go.sum=${dim}:"
LS_COLORS+="*requirements.txt=${py_color}:"
LS_COLORS+="*Pipfile=${py_color}:"
LS_COLORS+="*Pipfile.lock=${dim}:"
LS_COLORS+="*poetry.lock=${dim}:"
LS_COLORS+="*pyproject.toml=${py_color}:"
LS_COLORS+="*setup.py=${py_color}:"
LS_COLORS+="*setup.cfg=${py_color}:"
LS_COLORS+="*composer.json=${dusty_rose}:"
LS_COLORS+="*composer.lock=${dim}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              GIT FILES
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.git=${dim}:"
LS_COLORS+="*.gitignore=${dim}:"
LS_COLORS+="*.gitattributes=${dim}:"
LS_COLORS+="*.gitmodules=${dim}:"
LS_COLORS+="*.gitkeep=${dim}:"
LS_COLORS+="*.gitconfig=${dim}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              BUILD ARTIFACTS & CACHE
# ─────────────────────────────────────────────────────────────────────────────

# Compiled/Object files
LS_COLORS+="*.o=${dim}:"
LS_COLORS+="*.obj=${dim}:"
LS_COLORS+="*.a=${dim}:"
LS_COLORS+="*.lib=${dim}:"
LS_COLORS+="*.so=${dim}:"
LS_COLORS+="*.dll=${dim}:"
LS_COLORS+="*.dylib=${dim}:"
LS_COLORS+="*.pyc=${dim}:"
LS_COLORS+="*.pyo=${dim}:"
LS_COLORS+="*.class=${dim}:"
LS_COLORS+="*.elc=${dim}:"

# Build directories (via directory matching)
# Note: Directories are handled by 'di' but we can dim specific files
LS_COLORS+="*.min.js=${dim}:"
LS_COLORS+="*.min.css=${dim}:"
LS_COLORS+="*.map=${dim}:"
LS_COLORS+="*.d.ts=${dim}:"

# Cache files
LS_COLORS+="*.cache=${dim}:"
LS_COLORS+="*.tmp=${dim}:"
LS_COLORS+="*.temp=${dim}:"
LS_COLORS+="*.swp=${dim}:"
LS_COLORS+="*.swo=${dim}:"
LS_COLORS+="*.bak=${dim}:"
LS_COLORS+="*.backup=${dim}:"
LS_COLORS+="*.old=${dim}:"
LS_COLORS+="*.orig=${dim}:"
LS_COLORS+="*~=${dim}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              SECRETS & SENSITIVE FILES
# ─────────────────────────────────────────────────────────────────────────────
# Use terracotta (warning) with dim style for caution

local secret="${terracotta};${italic}"

LS_COLORS+="*.env=${secret}:"
LS_COLORS+="*.env.local=${secret}:"
LS_COLORS+="*.env.development=${secret}:"
LS_COLORS+="*.env.production=${secret}:"
LS_COLORS+="*.env.test=${secret}:"
LS_COLORS+="*.envrc=${secret}:"
LS_COLORS+="*.pem=${secret}:"
LS_COLORS+="*.key=${secret}:"
LS_COLORS+="*.crt=${secret}:"
LS_COLORS+="*.cer=${secret}:"
LS_COLORS+="*.p12=${secret}:"
LS_COLORS+="*.pfx=${secret}:"
LS_COLORS+="*.gpg=${secret}:"
LS_COLORS+="*.asc=${secret}:"
LS_COLORS+="*credentials=${secret}:"
LS_COLORS+="*credentials.json=${secret}:"
LS_COLORS+="*secrets=${secret}:"
LS_COLORS+="*secrets.json=${secret}:"
LS_COLORS+="*id_rsa=${secret}:"
LS_COLORS+="*id_ed25519=${secret}:"
LS_COLORS+="*id_dsa=${secret}:"
LS_COLORS+="*.keystore=${secret}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              DATA FILES
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.csv=${coral}:"
LS_COLORS+="*.tsv=${coral}:"
LS_COLORS+="*.sql=${teal}:"
LS_COLORS+="*.sqlite=${teal}:"
LS_COLORS+="*.db=${teal}:"
LS_COLORS+="*.graphql=${coral}:"
LS_COLORS+="*.gql=${coral}:"
LS_COLORS+="*.prisma=${coral}:"

# ─────────────────────────────────────────────────────────────────────────────
#                              FONTS
# ─────────────────────────────────────────────────────────────────────────────

LS_COLORS+="*.ttf=${dusty_rose}:"
LS_COLORS+="*.otf=${dusty_rose}:"
LS_COLORS+="*.woff=${dusty_rose}:"
LS_COLORS+="*.woff2=${dusty_rose}:"
LS_COLORS+="*.eot=${dusty_rose}:"

# Export the complete LS_COLORS
export LS_COLORS

# ══════════════════════════════════════════════════════════════════════════════
#                              EZA_COLORS
# ══════════════════════════════════════════════════════════════════════════════
# Eza uses its own color scheme that builds on LS_COLORS

export EZA_COLORS="$LS_COLORS"

# Add eza-specific colors
EZA_COLORS+="uu=${sage}:"                 # User (you)
EZA_COLORS+="un=${warm_gray}:"            # User (not you)
EZA_COLORS+="gu=${sage}:"                 # Group (yours)
EZA_COLORS+="gn=${warm_gray}:"            # Group (not yours)
EZA_COLORS+="da=${warm_gray}:"            # Date
EZA_COLORS+="sn=${fg}:"                   # Size number
EZA_COLORS+="sb=${warm_gray}:"            # Size unit
EZA_COLORS+="ur=${sage}:"                 # User read
EZA_COLORS+="uw=${coral}:"                # User write
EZA_COLORS+="ux=${sage}:"                 # User execute
EZA_COLORS+="gr=${sage}:"                 # Group read
EZA_COLORS+="gw=${coral}:"                # Group write
EZA_COLORS+="gx=${sage}:"                 # Group execute
EZA_COLORS+="tr=${sage}:"                 # Other read
EZA_COLORS+="tw=${coral}:"                # Other write
EZA_COLORS+="tx=${sage}:"                 # Other execute
EZA_COLORS+="hd=${bold};${coral}:"        # Header
EZA_COLORS+="ga=${sage}:"                 # Git added
EZA_COLORS+="gm=${coral}:"                # Git modified
EZA_COLORS+="gd=${terracotta}:"           # Git deleted
EZA_COLORS+="gv=${dusty_rose}:"           # Git renamed
EZA_COLORS+="gt=${warm_gray}:"            # Git typechange
EZA_COLORS+="gi=${dim}:"                  # Git ignored
EZA_COLORS+="gc=${teal}:"                 # Git conflicted
