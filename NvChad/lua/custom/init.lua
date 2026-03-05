local snippet_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

require("luasnip.loaders.from_vscode").lazy_load({
	paths = { snippet_path },
})
