local M = {}

function M.setup(dashboard)
	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		once = true,
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			dashboard.section.footer.val = "󱐌 " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
			-- Only redraw if we are actually in the alpha buffer
			if vim.bo.filetype == "alpha" then
				pcall(vim.cmd.AlphaRedraw)
			end
		end,
	})
end

return M
