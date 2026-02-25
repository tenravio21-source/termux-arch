return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	keys = {
		-- Basic Find
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fo",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Resume Last Search",
		},

		-- Search/Grep
		{
			"<leader>/",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search Project",
		},
		{
			"<leader>fg",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			desc = "Grep (Args)",
		},
		{
			"<leader>fz",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Fuzzy Search Buffer",
		},

		-- Special Search
		{
			"<leader>fF",
			function()
				require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
			end,
			desc = "Smart Open",
		},
		{
			"<leader>fu",
			function()
				require("telescope").extensions.notify.notify()
			end,
			desc = "Notification History",
		},
		{
			"<leader>ft",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Grep String Under Cursor",
		},

		-- LSP & Meta
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find Keymaps",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Document Symbols",
		},

		-- Visual Selection Search
		{
			"<leader>fv",
			function()
				local builtin = require("telescope.builtin")
				vim.cmd('normal! "vy')
				builtin.grep_string({ search = vim.fn.getreg("v") })
			end,
			mode = "v",
			desc = "Search Selection",
		},
	},
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
