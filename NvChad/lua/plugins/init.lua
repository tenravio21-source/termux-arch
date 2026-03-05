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
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key,
							["<C-w>"] = { "<c-s-w>", type = "command" },
							["<C-h>"] = "which_key",
							["<esc>"] = actions.close,
						},
						n = {
							["q"] = actions.close,
							["<C-n>"] = actions.move_selection_next,
							["<C-p>"] = actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<C-c>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-h>"] = "which_key",
						},
					},
					border = true,
					borderchars = {
						prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
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
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!{.git,node_modules,.DS_Store}",
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
			}
		end,
	},

	{ import = "nvchad.blink.lazyspec" },

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
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
