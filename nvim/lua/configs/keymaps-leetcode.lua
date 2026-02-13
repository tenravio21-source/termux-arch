local util = require("utils.keymaps")
local basic_map = util.basic_map

-- Core Dashboard & Session
basic_map("n", "<leader>zz", "<cmd>Leet<cr>", "LeetCode Menu")
basic_map("n", "<leader>zc", "<cmd>Leet exit<cr>", "Exit LeetCode")
basic_map("n", "<leader>zl", "<cmd>Leet list<cr>", "Problem List")

-- Execution & Testing
basic_map("n", "<leader>zr", "<cmd>Leet run<cr>", "Run Code")
basic_map("n", "<leader>zs", "<cmd>Leet submit<cr>", "Submit Code")
basic_map("n", "<leader>zv", "<cmd>Leet console<cr>", "Console Output")

-- Information & UI Toggles
basic_map("n", "<leader>zi", "<cmd>Leet info<cr>", "Question Info")
basic_map("n", "<leader>zh", "<cmd>Leet desc<cr>", "Toggle Description")
basic_map("n", "<leader>zS", "<cmd>Leet stats<cr>", "Toggle Stats")
basic_map("n", "<leader>zt", "<cmd>Leet tabs<cr>", "Question Tabs")

-- Discovery & Navigation
basic_map("n", "<leader>zd", "<cmd>Leet daily<cr>", "Daily Challenge")
basic_map("n", "<leader>zx", "<cmd>Leet random<cr>", "Random Problem")
basic_map("n", "<leader>zo", "<cmd>Leet open<cr>", "Open in Browser")

-- Code Management
basic_map("n", "<leader>zu", "<cmd>Leet last_submit<cr>", "Restore Last Submit")
basic_map("n", "<leader>zR", "<cmd>Leet reset<cr>", "Reset Snippet")
basic_map("n", "<leader>zg", "<cmd>Leet lang<cr>", "Change Language")
basic_map("n", "<leader>zf", "<cmd>Leet fold<cr>", "Fold Imports")
basic_map("n", "<leader>zy", "<cmd>Leet yank<cr>", "Yank Solution")

-- Cache & Auth
basic_map("n", "<leader>zC", "<cmd>Leet cache update<cr>", "Update Cache")
