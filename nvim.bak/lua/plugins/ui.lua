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
}
