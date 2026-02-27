#!/bin/bash

# Rofi theme
rofi_theme="$HOME/.config/rofi/config.rasi" 
msg='** Neovim Keybinds ** nvim 🚀 Search or press Enter to copy'

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

# Format & show via rofi
sed '1,/^# # NVIM_KEYBINDS # #$/d' "$0" | \
rofi -i -dmenu -mesg "$msg" -config "$rofi_theme" | \
awk '{print $1}' | \
xclip -selection clipboard

exit

# # NVIM_KEYBINDS # #
⌨️ General
Control+h/j/k/l             : Navigate windows (Normal)
Control+b                   : Move to start of line (Insert)
Control+e                   : Move to end of line (Insert)
Space                       : Leader Key (Disabled)
ALT+j/k                     : Move line up/down
jk                          : Exit Insert Mode
Control+s                   : Save File
Escape                      : Clear highlights
< / >                       : Indent/Unindent (Visual)

💻 Window Management
Space+-                     : Split Window Below
Space+\                     : Split Window Right
Space+q                     : Close Window
Space++h/-h                 : Adj. Window Height
Space++w/-w                 : Adj. Window Width

📁 File & Buffer
Space+fn                    : New File
Space+qa                    : Quit All
Shift+h                     : Previous Buffer
Shift+l                     : Next Buffer
Space+,                     : Switch Buffer (MRU)
Space+bp                    : Toggle Pin Buffer
Space+bo                    : Close Non-Pinned Buffers

🔎 Fzf-Lua (Search)
Space+ff                    : Find Files (Root)
Space+fF                    : Find Files (CWD)
Space+fg                    : Live Grep (Glob support)
Space+fb                    : Find Buffers
Space+fo                    : Recent Files
Space+fz                    : Fuzzy Find in Buffer
Space+ft                    : Search word under cursor
Space+fv                    : Search selection (Visual)
Space+fN                    : Edit NVIM Config
Space+ut                    : Colorscheme Picker (Filtered)

🛠️ LSP (Fzf-powered)
gd                          : Go to Definition
gr                          : Find References
gi                          : Go to Implementation
gt                          : Go to Type Definition
Space+la                    : Code Action (with Preview)
Space+ln                    : Rename Symbol
Space+ls                    : Document Symbols
Space+lS                    : Workspace Symbols (Live)
Space+dl                    : Workspace Diagnostics
K                           : Hover Documentation

✅ Todo
Space+I                     : Search Todo Comments (Fzf)
[t / ]t                     : Prev/Next Todo Jump

🌿 Git (Fzf-powered)
Space+gf                    : Search Git Files
Space+gb                    : Search Git Branches
Space+gc                    : Search Git Commits
Space+gC                    : Search Buffer Commits
Space+gs                    : Git Status (Diff view)

💻 Terminal & Tools
Space+t                     : Toggle Terminal
Esc+Esc                     : Exit ToggleTerm (Terminal Mode)
Space+zz                    : LeetCode Dashboard
Space+zl                    : Search LeetCode Problems

🚀 Flutter Tools
Space+Ff                    : Flutter Run
Space+Fq                    : Flutter Quit
Space+Fr                    : Flutter Hot Reload
Space+FR                    : Flutter Hot Restart
Space+Fd                    : Flutter Devices
