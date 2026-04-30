# User-local binaries (cargo, pipx-style tools, `claude`, etc.) and the
# Claudio tools directory both take precedence over system defaults.
# Anything executable dropped into ~/workspace/claudio/tools/ becomes a
# globally callable command — keep that dir reserved for tools, not
# scratch scripts.
export PATH="$HOME/.local/bin:$HOME/workspace/claudio/tools:$PATH"
