-- ══════════════════════════════════════════════════════════════════════════════
--                              Claude Colorscheme
--                    Warm, earthy tones inspired by Claude AI
-- ══════════════════════════════════════════════════════════════════════════════

local M = {}

M.colors = {
  -- Base colors
  bg = "#1a1816",
  bg_dark = "#151311",
  bg_light = "#2a2725",
  bg_lighter = "#3a3735",
  fg = "#e8dfd6",
  fg_dark = "#c4bab0",
  fg_muted = "#9a918a",

  -- Accent colors
  coral = "#d4a27f",       -- Primary accent, cursor, prompts
  terracotta = "#c4746e",  -- Errors, deletions
  sand = "#c4b28a",        -- Warnings, types, directories
  sage = "#8a9a7b",        -- Success, strings, additions
  dusty_rose = "#a292a3",  -- Keywords, special
  teal = "#8ea4a2",        -- Functions, links, info
  warm_gray = "#625e5a",   -- Comments, muted text

  -- Extended palette
  peach = "#e8b89d",       -- Numbers, constants
  lavender = "#b8a9c9",    -- Built-in functions
  mint = "#a3c4a2",        -- Strings (alternate)

  -- Semantic colors
  error = "#c4746e",
  warning = "#c4b28a",
  info = "#8ea4a2",
  hint = "#a292a3",
  success = "#8a9a7b",

  -- Git colors
  git_add = "#8a9a7b",
  git_change = "#c4b28a",
  git_delete = "#c4746e",

  -- Diff colors
  diff_add = "#2a3a2a",
  diff_change = "#3a3525",
  diff_delete = "#3a2525",
  diff_text = "#4a4535",

  -- UI colors
  border = "#625e5a",
  selection = "#3a3735",
  visual = "#3a3735",
  search = "#4a4030",
  match = "#5a4a3a",
}

function M.setup()
  local c = M.colors

  -- Reset highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "claude"

  local highlights = {
    -- ════════════════════════════════════════════════════════════════════════
    --                              Editor
    -- ════════════════════════════════════════════════════════════════════════
    Normal = { fg = c.fg, bg = c.bg },
    NormalNC = { fg = c.fg, bg = c.bg_dark },
    NormalFloat = { fg = c.fg, bg = c.bg_light },
    FloatBorder = { fg = c.border, bg = c.bg_light },
    FloatTitle = { fg = c.coral, bg = c.bg_light, bold = true },
    Cursor = { fg = c.bg, bg = c.coral },
    CursorLine = { bg = c.bg_light },
    CursorLineNr = { fg = c.coral, bold = true },
    LineNr = { fg = c.warm_gray },
    SignColumn = { fg = c.warm_gray, bg = c.bg },
    ColorColumn = { bg = c.bg_light },
    Visual = { bg = c.visual },
    VisualNOS = { bg = c.visual },
    Search = { fg = c.fg, bg = c.search },
    IncSearch = { fg = c.bg, bg = c.coral },
    CurSearch = { fg = c.bg, bg = c.coral },
    Substitute = { fg = c.bg, bg = c.terracotta },

    -- Pmenu (completion menu)
    Pmenu = { fg = c.fg, bg = c.bg_light },
    PmenuSel = { fg = c.fg, bg = c.selection },
    PmenuSbar = { bg = c.bg_lighter },
    PmenuThumb = { bg = c.coral },

    -- Statusline
    StatusLine = { fg = c.fg, bg = c.bg_light },
    StatusLineNC = { fg = c.warm_gray, bg = c.bg_dark },
    WinBar = { fg = c.fg, bg = c.bg },
    WinBarNC = { fg = c.warm_gray, bg = c.bg },
    WinSeparator = { fg = c.border },
    VertSplit = { fg = c.border },

    -- Tabline
    TabLine = { fg = c.warm_gray, bg = c.bg_dark },
    TabLineFill = { bg = c.bg_dark },
    TabLineSel = { fg = c.coral, bg = c.bg },

    -- Folding
    Folded = { fg = c.warm_gray, bg = c.bg_light },
    FoldColumn = { fg = c.warm_gray, bg = c.bg },

    -- Misc UI
    MatchParen = { fg = c.coral, bold = true, underline = true },
    ModeMsg = { fg = c.sage, bold = true },
    MoreMsg = { fg = c.sage },
    Question = { fg = c.sage },
    WarningMsg = { fg = c.warning },
    ErrorMsg = { fg = c.error },
    NonText = { fg = c.warm_gray },
    SpecialKey = { fg = c.warm_gray },
    Conceal = { fg = c.warm_gray },
    Directory = { fg = c.sand },
    Title = { fg = c.coral, bold = true },
    EndOfBuffer = { fg = c.bg },

    -- ════════════════════════════════════════════════════════════════════════
    --                              Syntax
    -- ════════════════════════════════════════════════════════════════════════
    Comment = { fg = c.warm_gray, italic = true },
    Constant = { fg = c.peach },
    String = { fg = c.sage },
    Character = { fg = c.sage },
    Number = { fg = c.peach },
    Boolean = { fg = c.peach },
    Float = { fg = c.peach },
    Identifier = { fg = c.fg },
    Function = { fg = c.teal },
    Statement = { fg = c.dusty_rose },
    Conditional = { fg = c.dusty_rose },
    Repeat = { fg = c.dusty_rose },
    Label = { fg = c.dusty_rose },
    Operator = { fg = c.fg_dark },
    Keyword = { fg = c.dusty_rose },
    Exception = { fg = c.dusty_rose },
    PreProc = { fg = c.coral },
    Include = { fg = c.dusty_rose },
    Define = { fg = c.dusty_rose },
    Macro = { fg = c.coral },
    PreCondit = { fg = c.dusty_rose },
    Type = { fg = c.sand },
    StorageClass = { fg = c.sand },
    Structure = { fg = c.sand },
    Typedef = { fg = c.sand },
    Special = { fg = c.coral },
    SpecialChar = { fg = c.coral },
    Tag = { fg = c.coral },
    Delimiter = { fg = c.fg_dark },
    SpecialComment = { fg = c.warm_gray },
    Debug = { fg = c.terracotta },
    Underlined = { underline = true },
    Ignore = { fg = c.warm_gray },
    Error = { fg = c.error },
    Todo = { fg = c.bg, bg = c.coral, bold = true },

    -- ════════════════════════════════════════════════════════════════════════
    --                              Diagnostics
    -- ════════════════════════════════════════════════════════════════════════
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
    DiagnosticVirtualTextError = { fg = c.error, bg = c.bg_light },
    DiagnosticVirtualTextWarn = { fg = c.warning, bg = c.bg_light },
    DiagnosticVirtualTextInfo = { fg = c.info, bg = c.bg_light },
    DiagnosticVirtualTextHint = { fg = c.hint, bg = c.bg_light },

    -- ════════════════════════════════════════════════════════════════════════
    --                              LSP
    -- ════════════════════════════════════════════════════════════════════════
    LspReferenceText = { bg = c.selection },
    LspReferenceRead = { bg = c.selection },
    LspReferenceWrite = { bg = c.selection },
    LspSignatureActiveParameter = { fg = c.coral, bold = true },
    LspCodeLens = { fg = c.warm_gray },
    LspInlayHint = { fg = c.warm_gray, bg = c.bg_light },

    -- ════════════════════════════════════════════════════════════════════════
    --                              Treesitter
    -- ════════════════════════════════════════════════════════════════════════
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.lavender },
    ["@variable.parameter"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.fg },
    ["@constant"] = { fg = c.peach },
    ["@constant.builtin"] = { fg = c.peach },
    ["@constant.macro"] = { fg = c.coral },
    ["@module"] = { fg = c.sand },
    ["@label"] = { fg = c.dusty_rose },
    ["@string"] = { fg = c.sage },
    ["@string.documentation"] = { fg = c.sage },
    ["@string.escape"] = { fg = c.coral },
    ["@string.regexp"] = { fg = c.coral },
    ["@character"] = { fg = c.sage },
    ["@boolean"] = { fg = c.peach },
    ["@number"] = { fg = c.peach },
    ["@number.float"] = { fg = c.peach },
    ["@type"] = { fg = c.sand },
    ["@type.builtin"] = { fg = c.sand },
    ["@type.definition"] = { fg = c.sand },
    ["@attribute"] = { fg = c.coral },
    ["@property"] = { fg = c.fg },
    ["@function"] = { fg = c.teal },
    ["@function.builtin"] = { fg = c.lavender },
    ["@function.macro"] = { fg = c.coral },
    ["@function.method"] = { fg = c.teal },
    ["@constructor"] = { fg = c.sand },
    ["@operator"] = { fg = c.fg_dark },
    ["@keyword"] = { fg = c.dusty_rose },
    ["@keyword.modifier"] = { fg = c.dusty_rose },
    ["@keyword.type"] = { fg = c.dusty_rose },
    ["@keyword.coroutine"] = { fg = c.dusty_rose },
    ["@keyword.function"] = { fg = c.dusty_rose },
    ["@keyword.operator"] = { fg = c.dusty_rose },
    ["@keyword.import"] = { fg = c.dusty_rose },
    ["@keyword.repeat"] = { fg = c.dusty_rose },
    ["@keyword.return"] = { fg = c.dusty_rose },
    ["@keyword.exception"] = { fg = c.dusty_rose },
    ["@keyword.conditional"] = { fg = c.dusty_rose },
    ["@punctuation.delimiter"] = { fg = c.fg_dark },
    ["@punctuation.bracket"] = { fg = c.fg_dark },
    ["@punctuation.special"] = { fg = c.coral },
    ["@comment"] = { fg = c.warm_gray, italic = true },
    ["@comment.documentation"] = { fg = c.warm_gray },
    ["@comment.error"] = { fg = c.error },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.todo"] = { fg = c.bg, bg = c.coral },
    ["@comment.note"] = { fg = c.info },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = c.coral, bold = true },
    ["@markup.quote"] = { fg = c.warm_gray, italic = true },
    ["@markup.math"] = { fg = c.teal },
    ["@markup.link"] = { fg = c.teal },
    ["@markup.link.url"] = { fg = c.teal, underline = true },
    ["@markup.raw"] = { fg = c.sage },
    ["@markup.list"] = { fg = c.coral },
    ["@diff.plus"] = { fg = c.git_add },
    ["@diff.minus"] = { fg = c.git_delete },
    ["@diff.delta"] = { fg = c.git_change },
    ["@tag"] = { fg = c.coral },
    ["@tag.attribute"] = { fg = c.sand },
    ["@tag.delimiter"] = { fg = c.fg_dark },

    -- ════════════════════════════════════════════════════════════════════════
    --                              Git
    -- ════════════════════════════════════════════════════════════════════════
    GitSignsAdd = { fg = c.git_add },
    GitSignsChange = { fg = c.git_change },
    GitSignsDelete = { fg = c.git_delete },
    DiffAdd = { bg = c.diff_add },
    DiffChange = { bg = c.diff_change },
    DiffDelete = { bg = c.diff_delete },
    DiffText = { bg = c.diff_text },

    -- ════════════════════════════════════════════════════════════════════════
    --                              Plugins
    -- ════════════════════════════════════════════════════════════════════════

    -- Telescope
    TelescopeNormal = { fg = c.fg, bg = c.bg_light },
    TelescopeBorder = { fg = c.border, bg = c.bg_light },
    TelescopeTitle = { fg = c.coral, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_lighter },
    TelescopePromptBorder = { fg = c.bg_lighter, bg = c.bg_lighter },
    TelescopePromptTitle = { fg = c.bg, bg = c.coral, bold = true },
    TelescopePromptPrefix = { fg = c.coral },
    TelescopePreviewTitle = { fg = c.bg, bg = c.sage, bold = true },
    TelescopeResultsTitle = { fg = c.bg_light, bg = c.bg_light },
    TelescopeSelection = { bg = c.selection },
    TelescopeSelectionCaret = { fg = c.coral },
    TelescopeMatching = { fg = c.coral, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg, bg = c.bg_dark },
    NvimTreeNormalNC = { fg = c.fg, bg = c.bg_dark },
    NvimTreeRootFolder = { fg = c.coral, bold = true },
    NvimTreeFolderIcon = { fg = c.sand },
    NvimTreeFolderName = { fg = c.sand },
    NvimTreeOpenedFolderName = { fg = c.sand, bold = true },
    NvimTreeEmptyFolderName = { fg = c.warm_gray },
    NvimTreeIndentMarker = { fg = c.warm_gray },
    NvimTreeGitDirty = { fg = c.git_change },
    NvimTreeGitNew = { fg = c.git_add },
    NvimTreeGitDeleted = { fg = c.git_delete },
    NvimTreeSpecialFile = { fg = c.coral },
    NvimTreeWinSeparator = { fg = c.bg_dark, bg = c.bg_dark },

    -- WhichKey
    WhichKey = { fg = c.coral },
    WhichKeyGroup = { fg = c.teal },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeperator = { fg = c.warm_gray },
    WhichKeySeparator = { fg = c.warm_gray },
    WhichKeyFloat = { bg = c.bg_light },
    WhichKeyBorder = { fg = c.border, bg = c.bg_light },
    WhichKeyValue = { fg = c.warm_gray },

    -- Dashboard
    DashboardHeader = { fg = c.coral },
    DashboardCenter = { fg = c.teal },
    DashboardShortCut = { fg = c.sand },
    DashboardFooter = { fg = c.warm_gray, italic = true },

    -- Bufferline
    BufferLineFill = { bg = c.bg_dark },
    BufferLineBackground = { fg = c.warm_gray, bg = c.bg_dark },
    BufferLineBuffer = { fg = c.warm_gray, bg = c.bg_dark },
    BufferLineBufferSelected = { fg = c.fg, bg = c.bg, bold = true },
    BufferLineBufferVisible = { fg = c.fg_dark, bg = c.bg },
    BufferLineCloseButton = { fg = c.warm_gray, bg = c.bg_dark },
    BufferLineCloseButtonSelected = { fg = c.terracotta, bg = c.bg },
    BufferLineIndicatorSelected = { fg = c.coral, bg = c.bg },
    BufferLineModified = { fg = c.git_change, bg = c.bg_dark },
    BufferLineModifiedSelected = { fg = c.git_change, bg = c.bg },
    BufferLineSeparator = { fg = c.bg_dark, bg = c.bg_dark },
    BufferLineSeparatorSelected = { fg = c.bg_dark, bg = c.bg },

    -- Indent Blankline
    IblIndent = { fg = c.bg_lighter },
    IblScope = { fg = c.warm_gray },

    -- Lazy
    LazyH1 = { fg = c.bg, bg = c.coral, bold = true },
    LazyButton = { fg = c.fg, bg = c.bg_lighter },
    LazyButtonActive = { fg = c.bg, bg = c.coral },
    LazySpecial = { fg = c.teal },

    -- Mason
    MasonHeader = { fg = c.bg, bg = c.coral, bold = true },
    MasonHighlight = { fg = c.teal },
    MasonHighlightBlock = { fg = c.bg, bg = c.teal },
    MasonHighlightBlockBold = { fg = c.bg, bg = c.teal, bold = true },
    MasonMuted = { fg = c.warm_gray },
    MasonMutedBlock = { fg = c.bg, bg = c.warm_gray },

    -- Cmp
    CmpItemAbbrMatch = { fg = c.coral, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.coral },
    CmpItemKindDefault = { fg = c.fg_dark },
    CmpItemMenu = { fg = c.warm_gray },
    CmpItemKindKeyword = { fg = c.dusty_rose },
    CmpItemKindVariable = { fg = c.fg },
    CmpItemKindConstant = { fg = c.peach },
    CmpItemKindReference = { fg = c.fg },
    CmpItemKindValue = { fg = c.peach },
    CmpItemKindFunction = { fg = c.teal },
    CmpItemKindMethod = { fg = c.teal },
    CmpItemKindConstructor = { fg = c.sand },
    CmpItemKindClass = { fg = c.sand },
    CmpItemKindInterface = { fg = c.sand },
    CmpItemKindStruct = { fg = c.sand },
    CmpItemKindEvent = { fg = c.coral },
    CmpItemKindEnum = { fg = c.sand },
    CmpItemKindUnit = { fg = c.peach },
    CmpItemKindModule = { fg = c.sand },
    CmpItemKindProperty = { fg = c.fg },
    CmpItemKindField = { fg = c.fg },
    CmpItemKindTypeParameter = { fg = c.sand },
    CmpItemKindEnumMember = { fg = c.peach },
    CmpItemKindOperator = { fg = c.fg_dark },
    CmpItemKindSnippet = { fg = c.sage },
    CmpItemKindText = { fg = c.fg },
    CmpItemKindFile = { fg = c.sand },
    CmpItemKindFolder = { fg = c.sand },
    CmpItemKindColor = { fg = c.coral },

    -- Flash
    FlashBackdrop = { fg = c.warm_gray },
    FlashLabel = { fg = c.bg, bg = c.coral, bold = true },
    FlashMatch = { fg = c.coral },
    FlashCurrent = { fg = c.bg, bg = c.sand },

    -- Noice
    NoiceCmdlinePopup = { fg = c.fg, bg = c.bg_light },
    NoiceCmdlinePopupBorder = { fg = c.border },
    NoiceCmdlineIcon = { fg = c.coral },
  }

  -- Apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
