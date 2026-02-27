return {
	"saghen/blink.cmp",
	event = { "BufReadPre", "BufNewFile" },
	version = "v0.*",
	dependencies = {
		{ "saghen/blink.compat", opts = { enable_events = true } },
		{
			"Exafunction/codeium.nvim",
			event = "InsertEnter",
			config = true, -- Simplified config
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = vim.fn.stdpath("config") .. "/snippets",
				})
			end,
		},
	},
	opts = {
		-- 1. Keymaps (Integrated)
		keymap = {
			["<C-k>"] = { "fallback" },
			["<C-b>"] = { "fallback" },
			["<C-z>"] = { "select_and_accept" },
			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_next()
					end
					if cmp.snippet_active() then
						return cmp.snippet_forward()
					end
					return false
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_prev()
					end
					if cmp.snippet_active() then
						return cmp.snippet_backward()
					end
					return false
				end,
				"fallback",
			},
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-f>"] = { "scroll_documentation_up", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
		},

		-- 2. Snippet Logic
		snippets = {
			preset = "luasnip",
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").locally_jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},

		-- 3. Appearance & Icons
		appearance = {
			use_nvim_cmp_as_default = true,
			kind_icons = {
				Codeium = "",
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Property = "",
				Class = "󰌗",
				Interface = "",
				Struct = "󰌗",
				Module = "",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				EnumMember = "",
				Keyword = "󰌋",
				Constant = "󰏿",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰊄",
			},
		},

		-- 4. Sources
		sources = {
			default = { "lsp", "codeium", "path", "snippets", "buffer" },
			providers = {
				codeium = {
					name = "codeium",
					module = "blink.compat.source",
					score_offset = 100,
					async = true,
					transform_items = function(_, items)
						for _, item in ipairs(items) do
							item.kind = vim.lsp.protocol.CompletionItemKind.Event
							item.kind_name = "Codeium"
						end
						return items
					end,
				},
			},
		},

		-- 5. General Config
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			ghost_text = { enabled = true },
			menu = {
				border = "rounded",
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
				},
			},
			documentation = { auto_show = true, window = { border = "rounded" } },
		},
		signature = { enabled = true, window = { border = "rounded" } },
	},
}
