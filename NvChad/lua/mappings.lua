require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- In Terminal mode ('t'), double Esc will toggle (hide) the floating terminal
map("t", "<Esc><Esc>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle floating term" })

-- Resize window using leader + arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

--clear search highlights
map("n", "<leader>sc", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
