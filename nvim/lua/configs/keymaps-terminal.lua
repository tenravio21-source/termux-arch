local util = require("utils.keymaps")
local basic_map = util.basic_map

-- Open Telescope search for todo comments
basic_map("n", "<leader>I", "<Cmd>TodoTelescope<CR>", "Todo Telescope")
