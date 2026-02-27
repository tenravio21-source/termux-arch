return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons" },
	opts = function()
		local actions = require("fzf-lua.actions")

		-- Pre-detect image previewer once to avoid loops inside setup
		local img_previewer = nil
		if vim.fn.executable("chafa") == 1 then
			img_previewer = { "chafa", "{file}", "--format=symbols" }
		elseif vim.fn.executable("viu") == 1 then
			img_previewer = { "viu", "-b" }
		end

		return {
			-- Profile base
			"default-title",
			fzf_colors = true,
			fzf_opts = {
				["--no-scrollbar"] = true,
				["--layout"] = "reverse",
			},
			defaults = {
				formatter = "path.dirname_first",
				-- Pre-merged keymaps to avoid deep nesting overrides
				keymap = {
					fzf = {
						["ctrl-q"] = "select-all+accept",
						["ctrl-u"] = "half-page-up",
						["ctrl-d"] = "half-page-down",
						["ctrl-f"] = "preview-page-down",
						["ctrl-b"] = "preview-page-up",
					},
				},
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
			ui_select = function(fzf_opts, items)
				return vim.tbl_deep_extend("force", fzf_opts, {
					prompt = " ",
					winopts = {
						title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
						title_pos = "center",
						width = 0.5,
						height = math.floor(math.min(vim.o.lines * 0.8, #items + 4) + 0.5),
					},
				})
			end,
			winopts = {
				width = 0.8,
				layout = "flex",
				height = 0.8,
				row = 0.5,
				col = 0.5,
				border = "rounded",
				preview = {
					layout = "flex",
					flex_flip = 100, -- Flip to vertical only if width < 100 columns
					scrollbar = "float",
				},
			},
			files = {
				cwd_prompt = false,
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
		}
	end,
	config = function(_, opts)
		-- Efficient profile merging
		if opts[1] == "default-title" then
			local profile = require("fzf-lua.profiles.default-title")
			opts = vim.tbl_deep_extend("force", profile, opts)
			opts[1] = nil
		end
		require("fzf-lua").setup(opts)
	end,
	keys = {
		{ "<leader>,", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root)" },
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files (Root)" },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
		{ "<leader>fN", "<cmd>FzfLua files cwd=~/.config/nvim<cr>", desc = "Find Config File" },
		{ "<leader>sb", "<cmd>FzfLua lines<cr>", desc = "Search Buffer Lines" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sS", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Goto Symbol" },
		{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Search Word" },
	},
}
