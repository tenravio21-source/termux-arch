return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons" },
	opts = function()
		local fzf = require("fzf-lua")
		local config = fzf.config
		local actions = fzf.actions

		-- 1. Keymap Overrides (Inside the FZF window)
		config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
		config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
		config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
		config.defaults.keymap.fzf["ctrl-x"] = "jump"
		config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
		config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"

		-- 2. Image Preview Logic
		-- Uses chafa or viu if installed on your system to show images in fzf
		local img_previewer
		for _, v in ipairs({
			{ cmd = "ueberzug", args = {} },
			{ cmd = "chafa", args = { "{file}", "--format=symbols" } },
			{ cmd = "viu", args = { "-b" } },
		}) do
			if vim.fn.executable(v.cmd) == 1 then
				img_previewer = vim.list_extend({ v.cmd }, v.args)
				break
			end
		end

		return {
			-- Use the "default-title" profile as a base
			"default-title",
			fzf_colors = true,
			fzf_opts = {
				["--no-scrollbar"] = true,
				["--layout"] = "reverse",
			},
			defaults = {
				formatter = "path.dirname_first", -- Shows folder name first for better scanning
			},
			previewers = {
				builtin = {
					extensions = {
						["png"] = img_previewer,
						["jpg"] = img_previewer,
						["gif"] = img_previewer,
						["webp"] = img_previewer,
					},
				},
			},
			-- This makes LSP code actions and "Select" menus look amazing
			ui_select = function(fzf_opts, items)
				return vim.tbl_deep_extend("force", fzf_opts, {
					prompt = " ",
					winopts = {
						title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
						title_pos = "center",
						width = 0.5,
						-- Dynamically adjusts height based on number of items
						height = math.floor(math.min(vim.o.lines * 0.8, #items + 4) + 0.5),
					},
				})
			end,
			winopts = {
				width = 0.8,
				height = 0.8,
				row = 0.5,
				col = 0.5,
				border = "rounded",
				preview = {
					scrollchars = { "┃", "" },
					layout = "vertical",
					vertical = "down:45%",
				},
			},
			files = {
				cwd_prompt = false,
				actions = {
					["alt-i"] = { actions.toggle_ignore }, -- Toggle hidden/ignored files on the fly
					["alt-h"] = { actions.toggle_hidden },
				},
			},
		}
	end,
	config = function(_, opts)
		-- This block ensures the "default-title" profile is correctly merged
		if opts[1] == "default-title" then
			local function fix(t)
				t.prompt = t.prompt ~= nil and " " or nil
				for _, v in pairs(t) do
					if type(v) == "table" then
						fix(v)
					end
				end
				return t
			end
			opts = vim.tbl_deep_extend("force", fix(require("fzf-lua.profiles.default-title")), opts)
			opts[1] = nil
		end
		require("fzf-lua").setup(opts)
	end,
	keys = {
		-- Basic Navigation
		{ "<leader>,", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root)" },
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files (Root)" },

		-- Find Group
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
		{
			"<leader>fN",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},

		-- Search Group
		{ "<leader>sb", "<cmd>FzfLua lines<cr>", desc = "Search Buffer Lines" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sS", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Goto Symbol" },
		{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Search Word" },
	},
}
