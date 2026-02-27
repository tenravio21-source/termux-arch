return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.icons",
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		sort_case_insensitive = true,
		sources = { "filesystem", "buffers", "git_status" },
		source_selector = {
			winbar = false,
			padding = { left = 1, right = 0 },
			sources = {
				{ source = "filesystem", display_name = "  Files" },
				{ source = "buffers", display_name = "  Buffers" },
				{ source = "git_status", display_name = " 󰊢 Git" },
			},
		},
		default_component_configs = {
			indent = { with_expanders = false },
			git_status = {
				symbols = {
					added = " ",
					deleted = " ",
					modified = " ",
					renamed = " ",
					untracked = " ",
					ignored = " ",
					unstaged = " ",
					staged = " ",
					conflict = " ",
				},
			},
		},
		window = {
			width = 35,
			position = "left",
			mappings = {
				["q"] = "close_window",
				["?"] = "show_help",
				["<C-v>"] = "open_vsplit",
				["<C-x>"] = "open_split",
				["<C-r>"] = "rename",
				["<C-d>"] = "delete",
				["<C-n>"] = "add",
			},
		},
		filesystem = {
			follow_current_file = { enabled = true },
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = { "node_modules", ".git", ".cache", "__pycache__" },
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.sources.manager").close_all()
				end,
			},
		},
	},
}
