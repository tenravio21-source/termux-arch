$env.PATH = ($env.PATH | split row (char env_sep) | append /data/data/com.termux/files/usr/bin)
