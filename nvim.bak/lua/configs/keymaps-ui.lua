local util = require("utils.keymaps")
local basic_map = util.basic_map
local safe_map = util.safe_map

basic_map("n", "<leader>h", "<cmd>Alpha<CR>", "Alpha")

basic_map("n", ";", ":", "Esc")

-- Reload nvim (LINE 8/9 area)
safe_map("n", "<leader>ur", function()
	vim.cmd("write")
	vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
	vim.notify("Config Reloaded!", vim.log.levels.INFO)
end, "Reload nvim")

safe_map("n", "<leader>ut", function()
	require("fzf-lua").colorschemes({
		winopts = {
			height = 0.5,
			width = 0.30,
		},
		ignore_patterns = {
			"^blue$",
			"^pablo",
			"^peachpuff",
			"^retrobox",
			"^sorbet",
			"^unokai",
			"^wildcharm",
			"^zaibatsu",
			"^darkblue$",
			"^default$",
			"^delek$",
			"^desert$",
			"^elflord$",
			"^evening$",
			"^habamax$",
			"^industry$",
			"^koehler$",
			"^lunaperche$",
			"^morning$",
			"^murphy$",
			"^pelflor$",
			"^ron$",
			"^shine$",
			"^slate$",
			"^torte$",
			"^zellner$",
			"^quiet$",
			"^vim$",
		},
	})
end, "Fzf-Lua: Colorscheme Picker")

-- Show Lazy logs
basic_map("n", "<leader>pl", "<cmd>Lazy log<CR>", "Show Lazy logs")

-- Check plugin health
basic_map("n", "<leader>ph", "<cmd>Lazy health<CR>", "Check plugin health")

-- Show recent messages (Vim messages)
basic_map("n", "<leader>pm", "<cmd>messages<CR>", "Show recent messages")

-- Show startup time (LINE 24 area)
safe_map("n", "<leader>pt", function()
	local stats = require("lazy").stats()
	local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
	vim.notify(
		string.format("⚡ Neovim loaded %d/%d plugins in %s ms", stats.loaded, stats.count, ms),
		vim.log.levels.INFO,
		{ title = "Lazy Startup" }
	)
end, "Show startup time")

-- Copy current file path (LINE 44 area)
safe_map("n", "<leader>Hp", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	vim.notify("Copied: " .. vim.fn.expand("%:p"), vim.log.levels.INFO, { title = "Path Copy" })
end, "Copy current file path")

-- Copy current file directory (LINE 50 area)
safe_map("n", "<leader>HP", function()
	vim.fn.setreg("+", vim.fn.expand("%:p:h"))
	vim.notify("Copied: " .. vim.fn.expand("%:p:h"), vim.log.levels.INFO, { title = "Path Copy" })
end, "Copy current file directory")
