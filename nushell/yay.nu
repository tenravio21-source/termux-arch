# custom search
def ysearch [] {
    let selection = (
        yay -Slq 
        | fzf --multi --ansi --preview-window=right:60% 
          --header "TAB: select, ENTER: install" 
          --preview "yay -Si {1} | bat --language=yaml --color=always"
    )
    
    if ($selection | is-not-empty) {
        let targets = ($selection | lines)
        yay -S ...$targets
    }
}

def yremove [] {
    let selection = (
        # -Qq lists only installed packages (Quietly)
        pacman -Qq 
        | fzf --multi --ansi 
          --header "TAB: select, ENTER: remove, ESC: cancel" 
          --preview "pacman -Qi {1} | bat --language=yaml --color=always"
    )
    
    if ($selection | is-not-empty) {
        let targets = ($selection | lines)
        # -Rs removes the package and its unused dependencies
        sudo pacman -Rs ...$targets
    }
}
