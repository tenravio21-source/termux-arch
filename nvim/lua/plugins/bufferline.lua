return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	version = "*",
	config = function()
		require("core.bufferline").setup()
	end,
}
