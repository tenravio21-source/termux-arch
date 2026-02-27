return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			"saghen/blink.cmp",
		},
		opts = {
			-- 1. Global Server Settings
			servers = {
				lua_ls = {
          cmd = { "lua-language-server" },
          root_dir = function() return vim.fs.root(0, { ".git", "init.lua", ".luarc.json" }) end,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enabled = false },
            },
          },
				},
				pyright = {},
				dartls = {},
				rust_analyzer = {},
				gopls = {},
			},
		},
		config = function(_, opts)
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local icons = require("core.icons")

			-- 2. Setup Diagnostics
			vim.diagnostic.config({
				virtual_text = false,
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

			-- 3. The 0.11 Logic: Register and Enable
			for server, server_opts in pairs(opts.servers) do
				-- Inject Blink capabilities into each server
				server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})

				-- Register the config (Discovery)
				vim.lsp.config(server, server_opts)

				-- Enable the server (Activation)
				vim.lsp.enable(server)
			end
		end,
	},
}
