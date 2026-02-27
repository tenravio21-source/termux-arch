return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			enabled = true,
			default_prompt = "➤ ",
			win_opts = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},
		select = {
			enabled = false,
		},
	},
}
