local M = {}

M.find_files_cwd = function()
	-- Only loads telescope when you actually call this function
	require("telescope.builtin").find_files({
		cwd = vim.fn.expand("%:p:h"),
		hidden = true,
	})
end

M.live_grep_cwd = function()
	require("telescope.builtin").live_grep({
		cwd = vim.fn.expand("%:p:h"),
		additional_args = function()
			return { "--hidden", "--glob", "!{.git,node_modules,.DS_Store}" }
		end,
	})
end

M.grep_word_under_cursor = function()
	require("telescope.builtin").grep_string({
		search = vim.fn.expand("<cword>"),
		additional_args = function()
			return { "--hidden", "--glob", "!{.git,node_modules,.DS_Store}" }
		end,
	})
end

return M
