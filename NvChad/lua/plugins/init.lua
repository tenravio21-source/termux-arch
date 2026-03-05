return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
	},

	{
		"folke/which-key.nvim",
		opts = {
			preset = "modern", -- v3 optimization: uses a much faster internal engine
			win = {
				border = "rounded",
				padding = { 1, 2 },
			},
			spec = {
				{ "<leader>c", group = "CheatSheet", icon = "󰓩 " },
				{ "<leader>f", group = "Find/File", icon = "󰈞 " },
				{ "<leader>g", group = "Git", icon = "󰊢 " },
				{ "<leader>p", group = "Plugins/Package", icon = "󰏖 " },
				{ "<leader>u", group = "UI/User", icon = "󰙵 " },
				{ "<leader>w", group = "LSP", icon = "󱂬 " },
				{ "<leader>x", group = "Trouble", icon = " " },
				{ "<leader>d", group = "Diagnostic", icon = "󱒇 " },
				{ "<leader>t", group = "Theme", icon = "󰚌 " },
				{ "<leader>m", group = "Mark", icon = "󰄲" },
				{ "<leader>r", group = "Rename", icon = "" },
			},
		},
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
				-- icons = {
				-- 	package_pending = " ",
				-- 	package_installed = "󰄲 ",
				-- 	package_uninstalled = " 󰚌 ",
				-- },
			},
		},
	},

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

	{ import = "nvchad.blink.lazyspec" },

	{
		"saghen/blink.cmp",
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"dart",
				"rust",
			},
		},
	},
}
