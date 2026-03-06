return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	ft = { "rust" },
	config = function()
		local on_attach = require("nvchad.configs.lspconfig").on_attach
		local capabilities = require("nvchad.configs.lspconfig").capabilities

		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					local map = vim.keymap.set
					map("n", "<leader>ca", function()
						vim.cmd.RustLsp("codeAction")
					end, { desc = "Rust Code Action", buffer = bufnr })
					map("n", "<leader>cr", function()
						vim.cmd.RustLsp("debuggables")
					end, { desc = "Rust Debuggables", buffer = bufnr })
				end,
				capabilities = capabilities,
				default_settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = true,
						procMacro = { enable = true },
						files = {
							watcher = "client",
							exclude = { ".git", "target", "node_modules" },
						},
					},
				},
			},
		}
	end,
}
