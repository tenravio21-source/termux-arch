local M = {}

function M.setup()
	local ok_lualine, lualine = pcall(require, "lualine")
	if not ok_lualine then
		return
	end

	local ok_sections, sections = pcall(require, "core.lualine.sections")
	if not ok_sections then
		return
	end

	lualine.setup({
		options = {
			theme = "auto",
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			globalstatus = true,
			disabled_filetypes = { statusline = { "alpha", "dashboard" } },
		},
		sections = sections.active,
		winbar = sections.winbar,
		inactive_winbar = sections.inactive_winbar,
	})
end

return M
