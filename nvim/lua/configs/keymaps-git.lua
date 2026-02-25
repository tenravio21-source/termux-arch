local util = require("utils.keymaps")
local safe_map = util.safe_map

-- 2. WRAP the calls in functions
-- Search Git Files
safe_map("n", "<leader>gf", function()
	require("telescope.builtin").git_files()
end, "Search Git Files (Telescope)")

-- Search Git Branches
safe_map("n", "<leader>gb", function()
	require("telescope.builtin").git_branches()
end, "Search Git Branches (Telescope)")

-- Search Git Commits
safe_map("n", "<leader>gc", function()
	require("telescope.builtin").git_commits()
end, "Search Git Commits (Telescope)")

-- Search Git Commits for Buffer
safe_map("n", "<leader>gC", function()
	require("telescope.builtin").git_bcommits()
end, "Search Git Buffer Commits (Telescope)")
