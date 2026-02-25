-- File: lua/plugins/telescope.lua

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"danielfalk/smart-open.nvim",
		"kkharji/sqlite.lua",
	},
	config = function()
		require("core.telescope").setup()
	end,
}
