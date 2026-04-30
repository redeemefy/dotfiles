# Tab completion — built into zsh, no external dependencies.
autoload -Uz compinit && compinit

# menu-style TAB selection (arrow keys to browse), case-insensitive
# matching, and partial-path completion (e.g. /u/l/b<TAB> → /usr/local/bin).
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
