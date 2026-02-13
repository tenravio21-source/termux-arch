local util = require("utils.keymaps")
local basic_map = util.basic_map

-- Core Actions
basic_map("n", "<leader>zz", "<cmd>Leet<cr>", "Dashboard")
basic_map("n", "<leader>zc", "<cmd>Leet exit<cr>", "Exit LeetCode")
basic_map("n", "<leader>zl", "<cmd>Leet list<cr>", "Search Problems")

-- Execution
basic_map("n", "<leader>zr", "<cmd>Leet run<cr>", "Run Solution")
basic_map("n", "<leader>zs", "<cmd>Leet submit<cr>", "Submit Solution")
basic_map("n", "<leader>zv", "<cmd>Leet console<cr>", "Toggle Console")

-- Views & Info
basic_map("n", "<leader>zi", "<cmd>Leet info<cr>", "Problem Info")
basic_map("n", "<leader>zh", "<cmd>Leet desc<cr>", "Toggle Description")
basic_map("n", "<leader>zt", "<cmd>Leet tabs<cr>", "List Tabs")

-- Discovery
basic_map("n", "<leader>zd", "<cmd>Leet daily<cr>", "Daily Challenge")
basic_map("n", "<leader>zx", "<cmd>Leet random<cr>", "Random Problem")

-- Code Utilities
basic_map("n", "<leader>zu", "<cmd>Leet last_submit<cr>", "Restore Last Submit")
basic_map("n", "<leader>zR", "<cmd>Leet reset<cr>", "Reset Snippet")
basic_map("n", "<leader>zg", "<cmd>Leet lang<cr>", "Change Language")
