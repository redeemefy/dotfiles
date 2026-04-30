# mise — polyglot runtime version manager (replaces asdf/rbenv/pyenv/etc).
# Guarded so machines without mise installed still start a clean shell.
if [ -x /opt/homebrew/bin/mise ]; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
fi
