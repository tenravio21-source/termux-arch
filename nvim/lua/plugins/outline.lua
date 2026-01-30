return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		-- Your setup opts here
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
