return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		opts = {
			n_lines = 500, -- How far to look for a text object
			-- custom_textobjects = {} -- This is where we can link it to Treesitter later
		},
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},
}
