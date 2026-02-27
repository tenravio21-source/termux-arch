return {
	"folke/todo-comments.nvim",
	dependencies = { "ibhagwan/fzf-lua" },
	cmd = { "TodoTrouble", "TodoFzfLua" },
	keys = {
		-- Swapped to FzfLua
		{ "<leader>I", "<cmd>TodoFzfLua<cr>", desc = "Todo Fzf-Lua" },
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next Todo",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous Todo",
		},
	},
	opts = {
		highlight = {
			keyword = "wide",
			after = "fg",
			pattern = [[.*<(KEYWORDS)\s*:]],
		},
		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "ISSUE" },
			},
			TODO = {
				icon = " ",
				color = "info",
			},
			WARNING = {
				icon = " ",
				color = "warning",
				alt = { "WARN", "CAUTION" },
			},
			PERF = {
				icon = "󰅒",
				color = "hint",
				alt = { "PERFORMANCE", "OPTIMIZE" },
			},
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS):]],
		},
	},
}
