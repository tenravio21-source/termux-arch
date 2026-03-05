return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = { border = "rounded" },
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			preset = "modern",
			transparent_bg = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = {
								checkThirdParty = false,
								library = vim.api.nvim_get_runtime_file("", true),
							},
						},
					},
				},
				pyrefly = {},
				rust_analyzer = {},
				gopls = {},
				dartls = {},
				clangd = {},
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup({})

			local icons = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = icons.Error,
						[vim.diagnostic.severity.WARN] = icons.Warn,
						[vim.diagnostic.severity.HINT] = icons.Hint,
						[vim.diagnostic.severity.INFO] = icons.Info,
					},
				},
			})

			for server, server_opts in pairs(opts.servers) do
				server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
				vim.lsp.config(server, server_opts)
				vim.lsp.enable(server)
			end
		end,
	},
}
