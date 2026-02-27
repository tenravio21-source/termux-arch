require("configs.options")
require("core.lazys")
require("configs.autocmds")
require("configs.keymaps")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.runner")
	end,
})

-- Use OSC 52 for clipboard (Best for SSH/Termux)
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("nvim-0.10") == 1 then
	-- Built-in support for 0.10+
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
		},
	}
end
