return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
  },
  opts = {
    outline_window = {
      position = "right",
      width = 25,
    },
    symbols = {
      filter = nil, -- Show all symbols
    },
    keymaps = {
      up_and_jump = "<up>",
      down_and_jump = "<down>",
    },
  },
}
