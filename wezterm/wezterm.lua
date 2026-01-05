-- ══════════════════════════════════════════════════════════════════════════════
--                              WezTerm Configuration
--                         Claude-themed Lua-powered terminal
-- ══════════════════════════════════════════════════════════════════════════════

local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ══════════════════════════════════════════════════════════════════════════════
--                              Claude Color Scheme
-- ══════════════════════════════════════════════════════════════════════════════

local claude_colors = {
	-- Base colors
	bg = "#1a1816",
	bg_dark = "#151311",
	bg_light = "#2a2725",
	fg = "#e8dfd6",
	fg_dim = "#c4bab0",
	fg_bright = "#f0e8e0",

	-- Accent colors
	coral = "#d4a27f",
	terracotta = "#c4746e",
	sand = "#c4b28a",
	sage = "#8a9a7b",
	dusty_rose = "#a292a3",
	teal = "#8ea4a2",
	warm_gray = "#625e5a",

	-- Bright variants
	coral_bright = "#e4b28f",
	terracotta_bright = "#d4847e",
	sand_bright = "#d4c29a",
	sage_bright = "#9aaa8b",
	dusty_rose_bright = "#b2a2b3",
	teal_bright = "#9eb4b2",
}

config.color_schemes = {
	["Claude"] = {
		foreground = claude_colors.fg,
		background = claude_colors.bg,

		cursor_fg = claude_colors.bg,
		cursor_bg = claude_colors.coral,
		cursor_border = claude_colors.coral,

		selection_fg = claude_colors.fg,
		selection_bg = "#3a3735",

		scrollbar_thumb = claude_colors.warm_gray,
		split = claude_colors.warm_gray,

		ansi = {
			claude_colors.bg_light, -- black
			claude_colors.terracotta, -- red
			claude_colors.sage, -- green
			claude_colors.sand, -- yellow
			claude_colors.teal, -- blue
			claude_colors.dusty_rose, -- magenta
			claude_colors.teal, -- cyan
			claude_colors.fg, -- white
		},
		brights = {
			claude_colors.warm_gray, -- bright black
			claude_colors.terracotta_bright, -- bright red
			claude_colors.sage_bright, -- bright green
			claude_colors.sand_bright, -- bright yellow
			claude_colors.teal_bright, -- bright blue
			claude_colors.dusty_rose_bright, -- bright magenta
			claude_colors.teal_bright, -- bright cyan
			claude_colors.fg_bright, -- bright white
		},

		compose_cursor = claude_colors.sand,

		-- Tab bar colors
		tab_bar = {
			background = claude_colors.bg,
			active_tab = {
				bg_color = claude_colors.coral,
				fg_color = claude_colors.bg,
				intensity = "Bold",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = claude_colors.bg_light,
				fg_color = claude_colors.fg,
			},
			inactive_tab_hover = {
				bg_color = claude_colors.warm_gray,
				fg_color = claude_colors.fg_bright,
				italic = false,
			},
			new_tab = {
				bg_color = claude_colors.bg,
				fg_color = claude_colors.warm_gray,
			},
			new_tab_hover = {
				bg_color = claude_colors.coral,
				fg_color = claude_colors.bg,
			},
		},
	},
}

config.color_scheme = "Claude"

-- ══════════════════════════════════════════════════════════════════════════════
--                              Font Configuration
-- ══════════════════════════════════════════════════════════════════════════════

config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
	{ family = "Symbols Nerd Font Mono", weight = "Regular" },
	"Apple Color Emoji",
})

config.font_size = 14.0
config.line_height = 1.1
config.cell_width = 1.0

config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Bold",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Bold",
			style = "Italic",
		}),
	},
}

-- ══════════════════════════════════════════════════════════════════════════════
--                              Window Configuration
-- ══════════════════════════════════════════════════════════════════════════════

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

config.window_background_opacity = 0.97
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false

config.initial_cols = 120
config.initial_rows = 36

-- ══════════════════════════════════════════════════════════════════════════════
--                              Tab Bar Configuration
-- ══════════════════════════════════════════════════════════════════════════════

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 32

-- Custom tab title with Claude icon
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	if tab.tab_title and #tab.tab_title > 0 then
		title = tab.tab_title
	end

	-- Truncate title if too long
	if #title > max_width - 4 then
		title = wezterm.truncate_right(title, max_width - 4) .. "..."
	end

	local index = tab.tab_index + 1
	return string.format(" %d: %s ", index, title)
end)

-- ══════════════════════════════════════════════════════════════════════════════
--                              Cursor Configuration
-- ══════════════════════════════════════════════════════════════════════════════

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.force_reverse_video_cursor = false

-- ══════════════════════════════════════════════════════════════════════════════
--                              Scrollback & Performance
-- ══════════════════════════════════════════════════════════════════════════════

config.scrollback_lines = 10000
config.enable_scroll_bar = false

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.animation_fps = 60
config.max_fps = 120

-- ══════════════════════════════════════════════════════════════════════════════
--                              Bell Configuration
-- ══════════════════════════════════════════════════════════════════════════════

config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 75,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 75,
	target = "CursorColor",
}

-- ══════════════════════════════════════════════════════════════════════════════
--                              Key Bindings
-- ══════════════════════════════════════════════════════════════════════════════

config.keys = {
	-- Tab management
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = act.MoveTabRelative(1) },

	-- Quick tab switching
	{ key = "1", mods = "CMD", action = act.ActivateTab(0) },
	{ key = "2", mods = "CMD", action = act.ActivateTab(1) },
	{ key = "3", mods = "CMD", action = act.ActivateTab(2) },
	{ key = "4", mods = "CMD", action = act.ActivateTab(3) },
	{ key = "5", mods = "CMD", action = act.ActivateTab(4) },
	{ key = "6", mods = "CMD", action = act.ActivateTab(5) },
	{ key = "7", mods = "CMD", action = act.ActivateTab(6) },
	{ key = "8", mods = "CMD", action = act.ActivateTab(7) },
	{ key = "9", mods = "CMD", action = act.ActivateTab(-1) },

	-- Pane management
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CMD|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },

	-- Vim-style pane navigation
	{ key = "h", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Down") },

	-- Pane resizing
	{ key = "LeftArrow", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Down", 5 }) },

	-- Toggle pane zoom
	{ key = "z", mods = "CMD", action = act.TogglePaneZoomState },

	-- Font size
	{ key = "+", mods = "CMD", action = act.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = act.ResetFontSize },

	-- Copy/Paste
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

	-- Scrolling
	{ key = "UpArrow", mods = "CMD", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "CMD", action = act.ScrollByLine(1) },
	{ key = "PageUp", mods = "CMD", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "CMD", action = act.ScrollByPage(1) },
	{ key = "Home", mods = "CMD", action = act.ScrollToTop },
	{ key = "End", mods = "CMD", action = act.ScrollToBottom },

	-- Search
	{ key = "f", mods = "CMD", action = act.Search("CurrentSelectionOrEmptyString") },

	-- Quick select mode (like hints)
	{ key = "Space", mods = "CMD|SHIFT", action = act.QuickSelect },

	-- Copy mode (vim-like)
	{ key = "x", mods = "CMD|SHIFT", action = act.ActivateCopyMode },

	-- Clear scrollback
	{ key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },

	-- Toggle fullscreen
	{ key = "Enter", mods = "CMD|SHIFT", action = act.ToggleFullScreen },

	-- New window
	{ key = "n", mods = "CMD", action = act.SpawnWindow },

	-- Reload config
	{ key = "r", mods = "CMD|SHIFT", action = act.ReloadConfiguration },

	-- Show launcher
	{
		key = "p",
		mods = "CMD|SHIFT",
		action = act.ShowLauncherArgs({ flags = "FUZZY|TABS|WORKSPACES|DOMAINS" }),
	},

	-- Command palette
	{ key = "p", mods = "CMD|CTRL", action = act.ActivateCommandPalette },

	-- Debug overlay
	{ key = "l", mods = "CMD|CTRL", action = act.ShowDebugOverlay },
}

-- ══════════════════════════════════════════════════════════════════════════════
--                              Mouse Bindings
-- ══════════════════════════════════════════════════════════════════════════════

config.mouse_bindings = {
	-- Right click paste
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("Clipboard"),
	},

	-- Cmd+click to open URLs
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = act.OpenLinkAtMouseCursor,
	},
}

-- ══════════════════════════════════════════════════════════════════════════════
--                              Hyperlinks
-- ══════════════════════════════════════════════════════════════════════════════

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Add custom rules for file paths
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}:[\\/][\S]+)["]?]],
	format = "file:///$1",
})

-- GitHub/GitLab issue/PR references
table.insert(config.hyperlink_rules, {
	regex = [[#(\d+)]],
	format = "https://github.com/OWNER/REPO/issues/$1",
})

-- ══════════════════════════════════════════════════════════════════════════════
--                              Quick Select Patterns
-- ══════════════════════════════════════════════════════════════════════════════

config.quick_select_patterns = {
	-- Git hashes
	"[0-9a-f]{7,40}",
	-- IP addresses
	"\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}",
	-- UUIDs
	"[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}",
}

-- ══════════════════════════════════════════════════════════════════════════════
--                              Misc Settings
-- ══════════════════════════════════════════════════════════════════════════════

config.automatically_reload_config = true
config.check_for_updates = false
config.show_update_window = false

config.default_prog = { "/bin/zsh", "-l" }
config.set_environment_variables = {
	TERM = "wezterm",
}

-- Use integrated title bar on macOS
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "MacOsNative"
config.integrated_title_button_alignment = "Left"

-- Right status showing date/time
wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%H:%M  %d-%b")
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = claude_colors.teal } },
		{ Text = " " .. date .. " " },
	}))
end)

return config
