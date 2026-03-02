return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local icon = require("core.icons")
		local lazy_status = require("lazy.status")

		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "alpha", "dashboard" } },
			},
			sections = {
				lualine_a = {
					{ "mode", icon = " ", padding = { left = 1, right = 1 } },
				},
				lualine_b = {
					{ "branch", icon = " ", padding = { left = 1, right = 1 } },
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return "No LSP"
							end
							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return table.concat(names, " | ")
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
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				},
				lualine_x = {
					{ lazy_status.updates, cond = lazy_status.has_updates },
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
					{ "encoding" },
					{ "filetype" },
				},
				lualine_y = {
					{ "progress" },
					{ "location", icon = " " },
				},
				lualine_z = {
					{
						function()
							return " " .. os.date("%R")
						end,
					},
				},
			},
			-- winbar = {
			-- 	lualine_a = {
			-- 		{
			-- 			"filename",
			-- 			path = 1,
			-- 			symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
			-- 			color = { gui = "bold" },
			-- 		},
			-- 	},
			-- },
		})
	end,
}
