local lazy_status = require("lazy.status")
local icon = require("core.icons")

local M = {}

M.active = {
	lualine_a = {
		{ "mode", icon = " ", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
	},
	lualine_b = {
		{ "branch", icon = " ", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
		{
			function()
				local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
				if #buf_clients == 0 then
					return "No LSP"
				end
				local client_names = {}
				for _, client in ipairs(buf_clients) do
					table.insert(client_names, client.name)
				end
				return table.concat(client_names, ", ")
			end,
			icon = " ",
			color = { gui = "bold" },
		},
	},
	lualine_c = {
		{
			"diagnostics",
			symbols = { error = icon.Error, warn = icon.Warn, info = icon.Info, hint = icon.Hint },
		},
		{
			"filetype",
			icon_only = true,
			separator = "",
			padding = { left = 1, right = 0 },
		},
	},
	lualine_x = {
		{
			lazy_status.updates,
			cond = lazy_status.has_updates,
			padding = { left = 1, right = 1 },
		},
		{
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
		},
		{ "encoding" },
		{ "fileformat" },
		{ "filetype" },
	},
	lualine_y = {
		{ "progress", padding = { left = 1, right = 1 } },
		{ "location", icon = " ", padding = { left = 1, right = 1 } },
	},
	lualine_z = {
		{
			function()
				return " " .. os.date("%R")
			end,
			padding = { left = 1, right = 1 },
		},
	},
}

M.winbar = {
	lualine_a = {
		{
			"filename",
			path = 1,
			symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
			color = { gui = "bold" },
		},
	},
	lualine_c = {
		{
			function()
				return require("nvim-navic").get_location()
			end,
			cond = function()
				return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
			end,
		},
	},
}

return M
