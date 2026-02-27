-- File: lua/plugins/trouble.lua

local mappings = require("core.trouble.mappings")

return {
	"folke/trouble.nvim",
	dependencies = { "folke/todo-comments.nvim" },
	cmd = { "Trouble" },
	opts = {
		modes = {
			lsp = {
				win = { position = "right" },
			},
		},
	},
	keys = mappings,
	config = function()
		require("core.trouble").setup()
	end,
}
