return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("core.lualine").setup()
	end,
}
