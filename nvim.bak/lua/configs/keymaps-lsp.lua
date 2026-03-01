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

		-- NAVIGATION
		util.safe_map("n", "gd", "FzfLua lsp_definitions", "LSP: Definition", b_opts)
		util.safe_map("n", "gi", "FzfLua lsp_implementations", "LSP: Implementation", b_opts)
		util.safe_map("n", "gt", "FzfLua lsp_typedefs", "LSP: Type Definition", b_opts)
		util.safe_map("n", "gr", "FzfLua lsp_references", "LSP: References", b_opts)

		-- ACTIONS
		-- Fzf-Lua code actions use that beautiful dynamic UI we configured earlier
		util.safe_map("n", "<leader>la", "FzfLua lsp_code_actions", "Code Actions", b_opts)
		util.safe_map("v", "<leader>la", "FzfLua lsp_code_actions", "Code Actions (Visual)", b_opts)
		util.safe_map("n", "<leader>ln", vim.lsp.buf.rename, "Rename Symbol", b_opts)

		-- DOCUMENTATION
		util.safe_map("n", "K", vim.lsp.buf.hover, "Hover Documentation", b_opts)
		util.safe_map("n", "gK", vim.lsp.buf.signature_help, "Signature Help", b_opts)

		-- SYMBOLS
		util.safe_map("n", "<leader>ls", "FzfLua lsp_document_symbols", "Document Symbols", b_opts)
		util.safe_map("n", "<leader>lS", "FzfLua lsp_live_workspace_symbols", "Workspace Symbols", b_opts)
	end,
})

util.safe_map("n", "<leader>dl", "FzfLua diagnostics_workspace", "All Diagnostics")
