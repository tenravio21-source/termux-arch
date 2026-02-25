local util = require("utils.keymaps")

-- Grouping the autocommand prevents duplicates if the file is re-sourced
local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,
	callback = function(ev)
		local b_opts = { buffer = ev.buf }

		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if not client then
			return
		end

		-- Check if the LSP supports document symbols (needed for Navic)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, ev.buf)
		end

		-- NAVIGATION
		util.safe_map("n", "gd", vim.lsp.buf.definition, "LSP: Definition", b_opts)
		util.safe_map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementation", b_opts)
		util.safe_map("n", "gt", vim.lsp.buf.type_definition, "LSP: Type Definition", b_opts)
		util.safe_map("n", "gr", "Telescope lsp_references", "LSP: References", b_opts)

		-- ACTIONS
		util.safe_map("n", "<leader>la", vim.lsp.buf.code_action, "Code Actions", b_opts)
		util.safe_map("v", "<leader>la", vim.lsp.buf.code_action, "Code Actions (Visual)", b_opts)
		util.safe_map("n", "<leader>ln", vim.lsp.buf.rename, "Rename Symbol", b_opts)
		util.safe_map("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, "Format Document", b_opts)

		-- DOCUMENTATION
		util.safe_map("n", "K", vim.lsp.buf.hover, "Hover Documentation", b_opts)
		util.safe_map("n", "gK", vim.lsp.buf.signature_help, "Signature Help", b_opts)

		-- SYMBOLS
		util.safe_map("n", "<leader>ls", "Telescope lsp_document_symbols", "Document Symbols", b_opts)
		util.safe_map("n", "<leader>lS", "Telescope lsp_dynamic_workspace_symbols", "Workspace Symbols", b_opts)
	end,
})

-- GLOBAL DIAGNOSTICS (No buffer lock needed)
util.safe_map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
util.safe_map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
util.safe_map("n", "<leader>dd", vim.diagnostic.open_float, "Show Diagnostic")
util.safe_map("n", "<leader>dl", "Telescope diagnostics", "All Diagnostics")
