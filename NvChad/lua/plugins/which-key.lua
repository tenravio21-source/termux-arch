return {
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
}
