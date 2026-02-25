local opt = vim.opt
local g = vim.g

-- =============================================================================
-- GLOBAL VARIABLES
-- =============================================================================
g.mapleader = " "

-- Disable default providers for faster startup
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- =============================================================================
-- CORE OPTIONS
-- =============================================================================
-- Line numbers & Cursor
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number" -- Only highlight the number, keeps UI clean
opt.signcolumn = "yes"
opt.colorcolumn = ""
opt.linespace = 2

-- Tabbing & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "nosplit" -- Preview renames/substitutions in real-time

-- Performance & System
opt.updatetime = 250
opt.timeoutlen = 400
opt.ttimeoutlen = 0
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- UI & Aesthetics
opt.termguicolors = true
opt.laststatus = 3 -- Global statusline
opt.cmdheight = 0 -- Hide command line when not in use (Modern look)
opt.showmode = false -- Don't show --INSERT--
opt.pumheight = 10 -- Max items in popup menu
opt.scrolloff = 10 -- Keep 10 lines padding when scrolling
opt.sidescrolloff = 8
opt.fillchars = { eob = " ", vert = "│" }

-- Window Splitting
opt.splitbelow = true
opt.splitright = true
opt.diffopt:append({ "vertical", "algorithm:patience", "linematch:60" })

-- Folding (Treesitter powered)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

-- =============================================================================
-- CURSOR & COMMAND LINE
-- =============================================================================
opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}

opt.wildmode = "longest:full,full"
opt.wildignorecase = true

-- =============================================================================
-- NEOVIDE SETTINGS
-- =============================================================================
if g.neovide then
	g.neovide_opacity = 0.8
	g.neovide_floating_corner_radius = 8
	g.neovide_cursor_vfx_mode = "railgun"
	g.neovide_cursor_animation_length = 0.13
	g.neovide_scroll_animation_length = 0.3
	g.neovide_hide_mouse_when_typing = true
end
