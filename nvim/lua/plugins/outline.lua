return {
	"hedyhli/outline.nvim",
	lazy = true,
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
			icons = {
				File = { icon = "󭊔", hl = "Identifier" },
				Module = { icon = "󰏗", hl = "Include" },
				Namespace = { icon = "󰅪", hl = "Include" },
				Package = { icon = "󰏗", hl = "Include" },
				Class = { icon = "󭵶", hl = "Type" },
				Method = { icon = "󰆧", hl = "Function" },
				Property = { icon = "󰜢", hl = "Identifier" },
				Field = { icon = "󰜢", hl = "Identifier" },
				Constructor = { icon = "󰆧", hl = "Special" },
				Interface = { icon = "󭵶", hl = "Type" },
				Function = { icon = "󰊕", hl = "Function" },
				Variable = { icon = "󰀫", hl = "Constant" },
				Constant = { icon = "󰏿", hl = "Constant" },
				String = { icon = "󰀬", hl = "String" },
				Number = { icon = "󰎠", hl = "Number" },
				Boolean = { icon = "󰨙", hl = "Boolean" },
				Array = { icon = "󱡠", hl = "Constant" },
				Object = { icon = "󭵶", hl = "Type" },
				Key = { icon = "󰌋", hl = "Type" },
				Null = { icon = "󰟢", hl = "Type" },
				EnumMember = { icon = "󰒻", hl = "Identifier" },
				Struct = { icon = "󭵶", hl = "Type" },
				Event = { icon = "󱐋", hl = "Type" },
				Operator = { icon = "󰆕", hl = "Operator" },
				TypeParameter = { icon = "󰊄", hl = "Type" },
			},
		},
		keymaps = {
			up_and_jump = "<up>",
			down_and_jump = "<down>",
		},
	},
}

--[[** 

Key     	        Action

Esc / q 	        Close outline
Enter 	          Go to symbol location in code
o 	              Go to symbol location in code without losing focus
Shift+Enter 	    Go to symbol location in code and close outline
Ctrl+g 	          Update outline window to focus on code location
K 	              Toggles the current symbol preview
Ctrl+Space 	      Hover current symbol (provider action)
r 	              Rename symbol
a 	              Code actions
h 	              Fold symbol or parent symbol
Tab 	            Toggle fold under cursor
Shift+Tab 	      Toggle all folds
l 	              Unfold symbol
W 	              Fold all symbols
E 	              Unfold all symbols
R 	              Reset all folding
Ctrl+k 	          Go up and peek location
Ctrl+j 	          Go down and peek location
? 	              Show current keymaps in a floating window

**--]]
