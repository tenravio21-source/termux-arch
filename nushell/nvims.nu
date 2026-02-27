def nvims [...args] {
    let items = ["nvim", "kickstart", "LazyVim", "NvChad", "AstroNvim"]
    let config = ($items | str join "\n" | fzf --prompt=" Neovim Config  " --height=40% --layout=reverse --border --exit-0 | str trim)

    if ($config | is-empty) {
        print "Nothing selected"
        return
    }

    # If it's the default 'nvim', we don't set the env var at all
    if $config == "nvim" {
        ^nvim ...$args
    } else {
        with-env { NVIM_APPNAME: $config } {
            ^nvim ...$args
        }
    }
}
