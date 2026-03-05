return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			enabled = true,
			default_prompt = "➤ ",
			win_opts = {
				border = "rounded",
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		select = {
			backend = { "fzf_lua", "telescope", "builtin" },
		},
	},
}
