#-----------------------------------------*******nvim******------------------------
def nvims [...args] {
  let items = ["rio", "kickstart", "LazyVim", "NvChad", "AstroNvim"]
  let config = ($items | to text | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)

  if ($config == null or $config == "") {
    print "Nothing selected"
    return
  }

  let appname = if $config == "rio" { "" } else { $config }

  with-env { NVIM_APPNAME: $appname } {
    nvim ...$args
  }
}

