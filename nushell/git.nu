# Enhanced git status with formatting
def gss [] {
    git status -s | lines | each {|line|
        let parts = ($line | split row ' ')
        let status = $parts.0
        let file = $parts.1
        match $status {
            "M" => { $"[(ansi green)modified(ansi reset)] ($file)" }
            "A" => { $"[(ansi yellow)added(ansi reset)] ($file)" }
            "D" => { $"[(ansi red)deleted(ansi reset)] ($file)" }
            "??" => { $"[(ansi blue)untracked(ansi reset)] ($file)" }
            _ => $line
        }
    }
}
