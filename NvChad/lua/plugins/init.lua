return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				initial_mode = "insert",
				prompt_prefix = "   ",
				selection_caret = "  ",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.70,
					},
					width = 0.87,
					height = 0.80,
				},
				file_ignore_patterns = {
					"node_modules",
					".git/",
					".DS_Store",
					"dist/",
					"build/",
				},
			},
			pickers = {
				buffers = { sort_lastused = true },
			},
		},
	},

	-- test new blink
	{ import = "nvchad.blink.lazyspec" },

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
