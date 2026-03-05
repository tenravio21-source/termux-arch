return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(colors)
				colors.bg_statusline = "NONE"
			end,
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			variant = "auto",
			transparent = true,
			italic_comments = true,
			borderless_pickers = false,
			terminal_colors = true,
			cache = false,
			extensions = {
				alpha = true,
				blinkcmp = true,
				notify = true,
				mini = true,
				indentblankline = true,
				lazy = true,
				noice = true,
				treesitter = true,
				treesittercontext = true,
				trouble = true,
				whichkey = true,
				...,
			},
			highlights = {
				Comment = { fg = "#9c9c9c", bg = "NONE", italic = true },
			},
		},
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
		opts = {
			options = {
				transparency = false,
			},
			styles = {
				types = "italic",
				methods = "italic",
				numbers = "italic",
				strings = "italic",
				comments = "italic",
				keywords = "italic",
				constants = "italic",
				functions = "italic",
				operators = "italic",
				variables = "italic",
				parameters = "italic",
				conditionals = "italic",
				virtual_text = "italic",
			},
		},
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			transparent_background = false,
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				dark = "macchiato",
			},
			float = {
				transparent = true, -- enable transparent floating windows
				solid = true, -- use solid styling for floating windows, see |winborder|
			},
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = { "bold" },
				functions = { "bold" },
				keywords = { "bold" },
				strings = { "italic" },
				variables = { "italic" },
				numbers = { "italic" },
				booleans = { "italic" },
				properties = { "bold" },
				types = { "bold" },
				operators = { "bold" },
			},
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				dashboard = true,
				flash = true,
				fzf = true,
				treesitter = true,
				notify = true,
				neotree = true,
				mason = true,
				noice = true,
				navic = { enabled = true, custom_bg = "lualine" },
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				neotest = true,
				semantic_tokens = true,
				snacks = true,
				telescope = true,
				treesitter_context = true,
				which_key = true,
				lsp_trouble = true,
				mini = {
					enabled = true,
					indentscope_color = "lavender",
				},
				blink_cmp = {
					style = "bordered",
				},
				indent_blankline = {
					enabled = true,
					scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = true,
				},
			},
		},
	},
}
