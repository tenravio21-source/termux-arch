return {
	{
		"rivoten05/colorify.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("colorify").run()
		end,
	},
}
