-- ══════════════════════════════════════════════════════════════════════════════
--                              Neovim Configuration
--                         Claude-themed, fast, and powerful
-- ══════════════════════════════════════════════════════════════════════════════
-- Performance target: <50ms startup time
-- Profile with: nvim --startuptime startup.log

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap and load plugins
require("core.lazy")

-- Set colorscheme (after plugins load)
vim.cmd.colorscheme("claude")
