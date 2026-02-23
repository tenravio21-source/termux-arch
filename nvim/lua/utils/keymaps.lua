local M = {}
local map = vim.keymap.set

--- @param mode string|table
--- @param lhs string
--- @param rhs_func function|string
--- @param desc string
--- @param extra_opts table|nil
function M.safe_map(mode, lhs, rhs_func, desc, extra_opts)
	-- Merge default desc with any extra options (like buffer = true)
	local options = vim.tbl_extend("force", { desc = desc }, extra_opts or {})

	map(mode, lhs, function()
		-- If rhs_func is a string (like a Vim command), wrap it in a cmd call
		local task = type(rhs_func) == "string"
				-- Using pcall on vim.cmd ensures we catch Vim errors too
				and function()
					vim.cmd(rhs_func)
				end
			or rhs_func

		local ok, err = pcall(task)
		if not ok then
			local command_name = desc:match("([^%s]+)$") or "Command"
			vim.notify(
				string.format("%s failed: %s", command_name, err),
				vim.log.levels.WARN,
				{ title = "Keymap Error" }
			)
		end
	end, options)
end

function M.basic_map(mode, lhs, rhs, desc)
	map(mode, lhs, rhs, { desc = desc })
end

return M
