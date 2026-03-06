local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		dart = { "dart_format" },
		-- c = { "clang-format" },
		-- cpp = { "clang-format" },
		-- go = { "gofumpt", "goimports-reviser", "golines" },
		-- css = { "prettier" },
		-- html = { "prettier" },
		-- python = { "isort", "black" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
