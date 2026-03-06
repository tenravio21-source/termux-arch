require("nvchad.configs.lspconfig").defaults()

local servers = { "lua-ls", "dartls", "rust_analyzer", "pyrefly" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
