# Quick directory listing with icons (simplified)
def lsg [] {
    ls | each {|file|
        let extension = ($file.name | path parse | get extension)
        let icon = match $extension {
            "nu" => "🐚",
            "rs" => "🦀", 
            "py" => "🐍",
            "js" => "📜",
            "ts" => "📘",
            "md" => "📝",
            "txt" => "📄",
            "zip" => "📦",
            "pdf" => "📕",
            _ => { if $file.type == "dir" { "📁" } else { "📄" } }
        }
        $"($icon) ($file.name)"
    }
}
