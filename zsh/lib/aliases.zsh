# ══════════════════════════════════════════════════════════════════════════════
#                              Aliases
# ══════════════════════════════════════════════════════════════════════════════

# === Navigation ===
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'             # Previous directory

# === File Operations (safe defaults) ===
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias ln='ln -iv'

# === Modern Replacements ===
# eza - modern ls
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=3 --icons --git-ignore'
alias lta='eza --tree --level=3 --icons -a'
alias l='eza -l --icons --group-directories-first'

# bat - modern cat
alias cat='bat --style=auto'
alias catp='bat --plain'      # No decorations

# ripgrep - modern grep
alias grep='rg'

# fd - modern find
alias find='fd'

# === Git ===
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate -20'
alias gll='git log --graph --pretty=format:"%C(#d4a27f)%h%Creset -%C(#c4b28a)%d%Creset %s %C(#625e5a)(%cr) %C(#8ea4a2)<%an>%Creset"'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gsw='git switch'
alias gswc='git switch -c'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'

# === Development ===
alias v='nvim'
alias vim='nvim'
alias lg='lazygit'
alias ld='lazydocker'
alias k='kubectl'
alias d='docker'
alias dc='docker compose'

# === Utilities ===
alias c='clear'
alias h='history'
alias reload='source ~/.zshrc && echo "Reloaded!"'
alias zshrc='$EDITOR ~/.zshrc'
alias path='echo $PATH | tr ":" "\n" | nl'
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s ifconfig.me'
alias localip='ipconfig getifaddr en0'
alias week='date +%V'
alias now='date +"%Y-%m-%d %H:%M:%S"'

# === Quick Edit Configs ===
alias dots='cd ~/dotfiles'
alias ealiases='$EDITOR ~/dotfiles/zsh/lib/aliases.zsh && reload'
alias efunctions='$EDITOR ~/dotfiles/zsh/lib/functions.zsh && reload'
alias estarship='$EDITOR ~/dotfiles/starship/starship.toml'

# === Homebrew ===
alias brewup='brew update && brew upgrade && brew cleanup'
alias brewinfo='brew leaves | xargs brew desc --eval-all'
