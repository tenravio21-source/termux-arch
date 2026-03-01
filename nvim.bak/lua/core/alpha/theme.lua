local M = {}

function M.setup(dashboard)
	-- Disable header to save rendering time
	dashboard.section.header.val = {}

	dashboard.section.buttons.val = {
		dashboard.button("n", "  > New File", "<cmd>enew<CR>"),
		dashboard.button("SPC e", "  > File Explorer", "<cmd>Neotree filesystem reveal left<CR>"),
		dashboard.button("SPC fp", "󰱼  > Find File", "<cmd>FzfLua files<CR>"),
		dashboard.button("SPC fg", "  > Find Word", "<cmd>FzfLua live_grep<CR>"),
		dashboard.button("u", "󰚰  > Update Plugins", "<cmd>Lazy sync<CR>"),
		dashboard.button("l", "󰒲  > Lazy", "<cmd>Lazy<CR>"),
		dashboard.button("m", "󰠅  > Mason", "<cmd>Mason<CR>"),
		dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
	}

	-- Set highlights once
	local hl_groups = {
		AlphaHeader = { fg = "#74c0fc", bold = true },
		AlphaButtons = { fg = "#f783ac" },
		AlphaFooter = { fg = "#51cf66", italic = true },
	}
	for group, opts in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end

	dashboard.section.buttons.opts.hl = "AlphaButtons"
	dashboard.section.footer.opts.hl = "AlphaFooter"
	dashboard.section.footer.val = "⚡ Neovim is ready"
end

return M
