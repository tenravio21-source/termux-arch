return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "thick",
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",

			-- Indicator & Icons
			indicator = {
				icon = "☕",
				style = "icon",
			},
			buffer_close_icon = "",
			close_icon = "-",
			modified_icon = "●",
			left_trunc_marker = "",
			right_trunc_marker = "",

			-- Sizing
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 20,
			enforce_regular_tabs = true,

			-- Neo-tree Integration
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
					separator = true,
				},
			},

			-- Diagnostics (Simplified require)
			diagnostics_indicator = function(_, _, diag)
				local icons = require("core.icons")
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,

			persist_buffer_sort = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			color_icons = true,
		},
		highlights = {
			fill = { bg = { attribute = "bg", highlight = "Normal" } },
			background = { bg = { attribute = "bg", highlight = "Normal" } },
			buffer_visible = { bg = { attribute = "bg", highlight = "Normal" } },
			offset_separator = { bg = { attribute = "bg", highlight = "Normal" } },
		},
	},
}
