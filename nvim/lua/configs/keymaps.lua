local wk = require("which-key")

-- 1. Register the Group Names FIRST
wk.add({
	{ "<leader>b", group = "Buffer", icon = "󰓩 " },
	{ "<leader>f", group = "Find/File", icon = "󰈞 " },
	{ "<leader>g", group = "Git", icon = "󰊢 " },
	{ "<leader>l", group = "LSP", icon = "󰒋 " },
	{ "<leader>p", group = "Plugins/Package", icon = "󰏖 " },
	{ "<leader>q", group = "Session/Quit", icon = "󰈆 " },
	{ "<leader>u", group = "UI/User", icon = "󰙵 " },
	{ "<leader>w", group = "Window", icon = "󱂬 " },
	{ "<leader>h", group = "Alpha", icon = "󰞋 " },
	{ "<leader>s", group = "Search", icon = "󱎸 " },
	{ "<leader>H", group = "File/Directory", icon = "󰓩 " },
	{ "<leader>z", group = "Leetcode", icon = "󰒋" },
	{ "<leader>x", group = "Trouble", icon = " " },
	{ "<leader>d", group = "Diagnostic", icon = "󱒇 " },
	{ "<leader>F", group = "Flutter", icon = "󰒋 " },
})

-- 2. NOW load your modular keymaps
local keymap_configs = { "core", "lsp", "git", "ui" }

for _, config_name in ipairs(keymap_configs) do
	local success, _ = pcall(require, "configs.keymaps-" .. config_name)
	if not success then
		vim.notify("Failed to load " .. config_name .. " keymaps", vim.log.levels.WARN)
	end
end
