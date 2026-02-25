return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	cmd = { "TodoTrouble", "TodoTelescope" },
	keys = {
		{ "<leader>I", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
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
				icon = " ", -- A wrench icon
				color = "error",
				alt = { "FIXME", "BUG", "ISSUE" }, -- Aliases
			},
			TODO = {
				icon = " ", -- A checkmark icon
				color = "info",
			},
			WARNING = {
				icon = " ", -- A warning icon
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

-- TODO:  This is Configuration file
-- FIX:
-- WARNING:
--PERF:
--NOTE:
