$env.FZF_DEFAULT_OPTS = (
    "--ansi " +
    "--reverse " +
    "--layout=reverse " +
    "--preview-window 'right:75%:wrap' " + 
    "--preview 'bat --color=always --theme=base16 --line-range :300 {}' " +
    # BINDINGS: Ctrl-f for Fullscreen, Ctrl-/ to hide
    "--bind 'ctrl-f:toggle-preview-fullscreen,ctrl-/:toggle-preview' " +
    # COLORS (Optimized for Black SSH)
    "--color=bg+:-1,bg:-1,spinner:#81a1c1,hl:#88c0d0 " +
    "--color=fg:#e5e9f0,header:#5e81ac,info:#b48ead,pointer:#88c0d0 " +
    "--color=marker:#ebcb8b,fg+:#eceff4,prompt:#81a1c1,hl+:#88c0d0 " +
    "--color=scrollbar:#4c566a,border:#4c566a"
)
