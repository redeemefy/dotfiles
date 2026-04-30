# Shared, deduplicated, large-enough history.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY        # merge history across concurrent shells
setopt HIST_IGNORE_DUPS     # don't record consecutive dupes
setopt HIST_IGNORE_ALL_DUPS # replace older copies when a command repeats
setopt HIST_REDUCE_BLANKS   # strip redundant whitespace before saving
setopt HIST_VERIFY          # expand `!` references instead of executing immediately

# Arrow-key history search: type a prefix then ↑/↓ to walk matching entries.
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
