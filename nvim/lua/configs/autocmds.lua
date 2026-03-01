local function augroup(name)
	return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- 1. Essential UI: Colorscheme
-- Only set if not already set (prevents double-loading)
if not vim.g.colors_name then
	vim.cmd.colorscheme("cyberdream")
end

-- 2. Buffer Behavior (Grouped for efficiency)
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(buf) then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Disable auto-comments on new lines
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = augroup("no_auto_comment"),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- 4. Window Management
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- 5. Auto-create directories on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- 6. Smart Relative Numbers (Toggle on Insert)
local number_group = augroup("smart_numbers")
vim.api.nvim_create_autocmd("InsertEnter", {
	group = number_group,
	callback = function()
		if vim.wo.relativenumber then
			vim.w.relativenumber_was_on = true
			vim.wo.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = number_group,
	callback = function()
		if vim.w.relativenumber_was_on then
			vim.wo.relativenumber = true
			vim.w.relativenumber_was_on = false
		end
	end,
})

-- 7. Ghost Text for Blink.cmp
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment" })
