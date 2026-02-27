return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	config = function()
		require("core.lualine").setup()
	end,
}
