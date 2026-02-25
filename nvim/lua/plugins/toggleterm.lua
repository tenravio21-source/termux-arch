return {
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
			{ "<esc><esc>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Exit ToggleTerm" },
		},
		config = function()
			require("toggleterm").setup({
				start_in_insert = true,
				shell = "nu",
				insert_mappings = true,
				close_on_exit = true,
				direction = "float",
				persist_size = true,
				persist_mode = true,
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				float_opts = {
					border = "rounded",
				},
			})
		end,
	},
}
