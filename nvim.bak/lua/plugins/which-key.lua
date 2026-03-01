return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- v3 optimization: uses a much faster internal engine
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },
    -- Use the spec table to define your group names once
   spec = {
      { "<leader>b", group = "Buffer", icon = "󰓩 " },
      { "<leader>f", group = "Find/File", icon = "󰈞 " },
      { "<leader>g", group = "Git", icon = "󰊢 " },
      { "<leader>l", group = "LSP", icon = "󰒋 " },
      { "<leader>p", group = "Plugins/Package", icon = "󰏖 " },
      { "<leader>q", group = "Session/Quit", icon = "󰈆 " },
      { "<leader>u", group = "UI/User", icon = "󰙵 " },
      { "<leader>w", group = "Window", icon = "󱂬 " },
      { "<leader>h", group = "Alpha", icon = "󰞋 " },
      { "<leader>s", group = "Search", icon = "󱎸 " },
      { "<leader>H", group = "File/Directory", icon = "󰓩 " },
      { "<leader>z", group = "Leetcode", icon = "󰒋" },
      { "<leader>x", group = "Trouble", icon = " " },
      { "<leader>d", group = "Diagnostic", icon = "󱒇 " },
      { "<leader>F", group = "Flutter", icon = "󰒋 " },
    },    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
  },
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Keymaps" },
    { "<leader>wk", function() require("which-key").show({ global = true }) end, desc = "Global Keymaps" },
  },
}
