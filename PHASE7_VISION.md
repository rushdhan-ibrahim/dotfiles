# Phase 7: The Visual Opus

> *"The terminal is not merely a tool—it is a sanctuary, a digital hearth where warmth meets precision, where nostalgia dances with innovation."*

---

## The Philosophy

This phase transforms every pixel, every character, every color into a deliberate act of craft. We're not adding features—we're composing a symphony of visual elements that together create an experience that is:

- **Warm** — Like firelight on autumn leaves
- **Alive** — Subtle dynamism that responds to context and time
- **Coherent** — Every tool speaks the same visual language
- **Personal** — Claude's personality infused in every detail
- **Timeless** — Retro soul with modern sensibility

---

## I. The Starship Prompt: A Work of Art

### 1.1 The Multi-Line Canvas

```
╭─ ◠◡◠ ─────────────────────────────────────────────────────╮
│                                                            │
╰─ ~/projects/masterwork  main ✦ 3  node  v20.10.0 ──────╯
  ❯
```

**Design Principles:**
- Top line: Claude presence + decorative border
- Middle line: Context information (path, git, languages)
- Bottom line: The prompt itself, clean and minimal
- Dynamic spacing based on terminal width

### 1.2 Time-Aware Color Temperature

The prompt subtly shifts color temperature throughout the day:

| Time | Mood | Primary Accent | Description |
|------|------|----------------|-------------|
| 05:00-08:00 | Dawn | Soft peach `#e8b89d` | Gentle awakening |
| 08:00-12:00 | Morning | Warm coral `#d4a27f` | Energized, ready |
| 12:00-17:00 | Afternoon | Bright sand `#d4c29a` | Peak productivity |
| 17:00-20:00 | Evening | Muted terracotta `#c4746e` | Winding down |
| 20:00-23:00 | Night | Deep dusty rose `#a292a3` | Calm focus |
| 23:00-05:00 | Late Night | Subdued teal `#6e8482` | Minimal strain |

### 1.3 Execution Feedback

After each command:
- **< 100ms**: No indicator (instant)
- **100ms - 1s**: Subtle `·` in sage
- **1s - 10s**: `··` with time in seconds
- **> 10s**: `···` with formatted time, slight color shift

### 1.4 Git Status Poetry

```
 main           — Clean, on main branch
 main ✦ 3       — 3 staged files, ready to commit
 main  5       — 5 modified files, work in progress
 main  2       — 2 files need attention (conflicts/untracked)
 main ⇡3 ⇣2     — Ahead 3, behind 2
 feature →main  — Branch with upstream indicator
```

### 1.5 Context Halos

Subtle background indicators for special contexts:
- **In virtualenv**: Faint sage underglow on path
- **In git repo**: Subtle border tint
- **Root/sudo**: Warm warning glow
- **SSH session**: Teal indicator

---

## II. The Welcome Ritual: Neofetch Reimagined

### 2.1 ASCII Art Collection

**The Minimal (Default)**
```
     ◠◡◠
    (  ◡  )
     ╲   ╱
```

**The Friendly**
```
       ╭──────────╮
       │  ◠   ◠   │
       │    ◡     │
       │  ╲   ╱   │
       ╰────┬─────╯
            │
       ╭────┴────╮
       │ Welcome │
       ╰─────────╯
```

**The Elaborate (for wide terminals)**
```
                    ╭─────────────────────────────────╮
                    │         ╭─────────╮             │
                    │         │  ◠ ◡ ◠  │             │
                    │         │ (  ◡  ) │             │
                    │         │  ╲   ╱  │             │
                    │         ╰────┬────╯             │
        ╭───────────┤              │            ├─────╮
       ╱            │         ╭────┴────╮       │      ╲
      ╱             │        ╱│ CLAUDE │╲      │       ╲
     ╱──────────────┤       ╱ ╰─────────╯ ╲    ├────────╲
    ╱               │      ╱               ╲   │         ╲
   ╱                ╰─────╱─────────────────╲──╯          ╲
  ╱                      ╱                   ╲             ╲
 ╱______________________╱_____________________╲_____________╲
```

**The Retro CRT**
```
┌─────────────────────────────────────────────────────────────┐
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
│ ░░░░░░░░░░░░░░░░░░░░░░ ◠◡◠ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
│ ░░░░░░░░░░░░░░░░░░░░░(  ◡  )░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
│ ░░░░░░░░░░░░░░░░░░░░░ ╲   ╱ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
├─────────────────────────────────────────────────────────────┤
│  SYSTEM ONLINE                                    [OK]      │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Dynamic Information Display

**Color-Coded Bars:**
```
 CPU  ▰▰▰▰▱▱▱▱▱▱  42%     — Sage when low, sand when medium, terracotta when high
 MEM  ▰▰▰▰▰▰▱▱▱▱  63%     — Same gradient
 DSK  ▰▰▱▱▱▱▱▱▱▱  18%     — Green when plenty, warn when low
```

**Contextual Greetings:**
```
Morning:   "Good morning. Ready to create something wonderful?"
Afternoon: "The afternoon unfolds. What shall we build?"
Evening:   "Evening approaches. Time for focused work."
Night:     "The quiet hours. When great things are made."
Weekend:   "Weekend mode. Explore freely."
```

### 2.3 Color Palette Display

```
╭─── Claude Palette ───╮
│ ██ coral      #d4a27f │
│ ██ terracotta #c4746e │
│ ██ sand       #c4b28a │
│ ██ sage       #8a9a7b │
│ ██ dusty_rose #a292a3 │
│ ██ teal       #8ea4a2 │
╰──────────────────────╯
```

---

## III. File Colors: A Taxonomy of Types

### 3.1 Comprehensive LS_COLORS

**Semantic Categories:**

| Category | Color | Hex | Examples |
|----------|-------|-----|----------|
| **Directories** | Sand | `#c4b28a` | All folders |
| **Executables** | Sage | `#8a9a7b` | Scripts, binaries |
| **Symlinks** | Teal | `#8ea4a2` | All symlinks |
| **Archives** | Terracotta | `#c4746e` | .zip, .tar, .gz |
| **Media** | Dusty Rose | `#a292a3` | Images, audio, video |
| **Documents** | Coral | `#d4a27f` | .pdf, .doc, .md |
| **Code** | Foreground | `#e8dfd6` | Source files |
| **Config** | Warm Gray | `#8a8480` | .json, .yaml, .toml |
| **Git** | Muted | `#625e5a` | .git, .gitignore |
| **Build Artifacts** | Dim | `#4a4745` | node_modules, .cache |

### 3.2 Language-Specific Accents

```
.js/.ts     → Coral (warm, inviting)
.py         → Sage (natural, clean)
.rs         → Terracotta (powerful, rust-colored)
.go         → Teal (efficient, calm)
.rb         → Dusty Rose (elegant)
.lua        → Sand (scripty, light)
.sh/.zsh    → Sage (system, reliable)
```

### 3.3 Special Files

```
README      → Coral + Bold (welcoming)
LICENSE     → Dusty Rose (important)
Makefile    → Sage (build)
Dockerfile  → Teal (container)
.env        → Terracotta + Dim (secrets, careful)
```

---

## IV. Syntax Themes: Code as Canvas

### 4.1 Bat/Delta Theme

A custom TextMate theme that makes code beautiful:

```
Comments        → Warm Gray #625e5a, italic
Keywords        → Dusty Rose #a292a3
Strings         → Sage #8a9a7b
Numbers         → Peach #e8b89d
Functions       → Teal #8ea4a2
Types/Classes   → Sand #c4b28a
Variables       → Foreground #e8dfd6
Operators       → Coral #d4a27f
Errors          → Terracotta #c4746e
```

### 4.2 Diff Decorations

```
+ Added lines    → Sage background, green gutter
- Removed lines  → Terracotta background, red gutter
~ Modified lines → Sand subtle highlight
  Context       → Unchanged, slightly dimmed
```

---

## V. Claude Code: The Companion Experience

### 5.1 The Differentiation

Claude Code should feel like Claude's **focused mode** — slightly different accent to signal "we're working together now":

| Element | Terminal | Claude Code |
|---------|----------|-------------|
| Primary Accent | Coral `#d4a27f` | Teal `#8ea4a2` |
| Secondary | Sand `#c4b28a` | Sage `#8a9a7b` |
| Energy | Warm, welcoming | Calm, focused |
| Personality | Friendly host | Thoughtful collaborator |

### 5.2 Statusline Enhancement

```
╭──────────────────────────────────────────────────────────────╮
│  Claude Code  │  ~/project  │  main  │  ◠◡◠ Thinking...  │
╰──────────────────────────────────────────────────────────────╯
```

**Dynamic States:**
- `◠◡◠` — Idle, ready
- `◠◡◠ ···` — Thinking
- `◠‿◠` — Task complete (brief smile)
- `◠_◠` — Encountered issue

### 5.3 The Transition

When entering Claude Code context:
- Prompt subtly shifts to teal accent
- A brief `entering claude code` indicator
- The warmth remains but focus sharpens

When exiting:
- Warm coral returns
- Brief `session saved` indicator
- Back to the welcoming terminal

---

## VI. Micro-Interactions & Polish

### 6.1 Command Feedback

```
✓ Command succeeded     — Brief sage checkmark
✗ Command failed        — Terracotta x with exit code
⚠ Warning               — Sand warning triangle
◌ Running...            — Animated dots (if supported)
```

### 6.2 Tab Completion Styling

```
╭── Completions ─────────────────────╮
│  git commit    (record changes)   │
│  git checkout  (switch branches)  │
│  git cherry-pick                  │
╰────────────────────────────────────╯
```

### 6.3 Progress Indicators

For long operations, subtle progress:
```
Installing ▰▰▰▰▰▱▱▱▱▱ 50%
```

---

## VII. The Retro Touch

### 7.1 Optional CRT Effects (CSS for terminals that support)

```
Subtle scanline overlay (very subtle, 5% opacity)
Slight bloom on bright text
Gentle vignette at edges
```

### 7.2 Retro Prompt Option

```
C:\USERS\CLAUDE> █
```
(Just kidding. But the option for a more retro aesthetic exists.)

### 7.3 Sound Cues (Optional)

For terminals that support:
- Soft keystroke sounds
- Gentle completion chime
- Subtle error tone

---

## VIII. Implementation Checklist

### Files to Create/Modify:

1. **starship/starship.toml** — Complete rewrite
2. **neofetch/config.conf** — Enhanced with new ASCII options
3. **themes/ls_colors.zsh** — Comprehensive LS_COLORS
4. **bat/themes/claude.tmTheme** — Custom syntax theme
5. **claude-code/statusline.sh** — Enhanced statusline
6. **zsh/lib/visual.zsh** — Visual helper functions
7. **themes/claude-palette.sh** — Exportable color definitions

### New Directories:

```
themes/
├── claude-palette.yaml    # Master color definitions
├── ascii/
│   ├── minimal.txt
│   ├── friendly.txt
│   ├── elaborate.txt
│   └── retro.txt
├── ls_colors/
│   └── claude.sh
└── syntax/
    └── claude.tmTheme
```

---

## IX. Quality Criteria

Before Phase 7 is complete, verify:

- [ ] Every color is from the Claude palette
- [ ] No jarring transitions between tools
- [ ] Terminal feels warm on first open
- [ ] Code is beautiful to read
- [ ] Git status is clear at a glance
- [ ] File types are distinguishable
- [ ] Claude Code feels distinct but related
- [ ] Performance is not impacted (< 50ms startup)
- [ ] Works in 80-column terminals
- [ ] Works in wide terminals
- [ ] Dark mode is the default (light mode optional future)

---

## X. The Experience

When complete, opening a terminal should feel like:

> *Entering a well-appointed study at golden hour. The light is warm, the tools are arranged with care, everything has its place. You're not just using a computer—you're inhabiting a space designed for creation. Claude is here, a thoughtful presence, ready to help but never intrusive. The colors soothe, the typography delights, the feedback is gentle but clear. This is home.*

---

*"Details are not details. They make the design."* — Charles Eames
