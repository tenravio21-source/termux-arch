return {
	"folke/which-key.nvim",
	opts = {
		preset = "modern", -- v3 optimization: uses a much faster internal engine
		win = {
			border = "rounded",
			padding = { 1, 2 },
		},
		spec = {
			{ "<leader>c", group = "Cheatsheet", icon = "󰚩 " },
			{ "<leader>f", group = "Finder", icon = "󰍉 " },
			{ "<leader>g", group = "Git", icon = "󰊢 " },
			{ "<leader>p", group = "Packages", icon = "󰏖 " },
			{ "<leader>u", group = "Interface", icon = "󰙵 " },
			{ "<leader>w", group = "Workspace/LSP", icon = "󱔗 " },
			{ "<leader>d", group = "Debug/Diagnostics", icon = "󰒓 " },
			{ "<leader>t", group = "Appearance", icon = "󰏘 " },
			{ "<leader>m", group = "Marks", icon = "󰀱 " },
			{ "<leader>r", group = "Refactor", icon = "󰑕 " },
			{ "<leader>s", group = "Search/Flash", icon = "󱗘 " },
			{ "<leader>z", group = "LeetCode", icon = "󰛠 " },
		},
	},
}
