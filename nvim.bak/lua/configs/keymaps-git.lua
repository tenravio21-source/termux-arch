local util = require("utils.keymaps")
local safe_map = util.safe_map

-- Search Git Files
safe_map("n", "<leader>gf", function()
	require("fzf-lua").git_files()
end, "Search Git Files (Fzf-Lua)")

-- Search Git Branches
safe_map("n", "<leader>gb", function()
	require("fzf-lua").git_branches()
end, "Search Git Branches (Fzf-Lua)")

-- Search Git Commits (Project Wide)
safe_map("n", "<leader>gc", function()
	require("fzf-lua").git_commits()
end, "Search Git Commits (Fzf-Lua)")

-- Search Git Commits for Current Buffer
safe_map("n", "<leader>gC", function()
	require("fzf-lua").git_bcommits()
end, "Search Git Buffer Commits (Fzf-Lua)")

-- Git Status (Added this because it's great in Fzf-Lua)
safe_map("n", "<leader>gs", function()
	require("fzf-lua").git_status()
end, "Git Status (Fzf-Lua)")
