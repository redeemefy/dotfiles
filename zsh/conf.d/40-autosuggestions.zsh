# zsh-autosuggestions — the grey-ghost inline history suggestion that
# made oh-my-zsh feel magical. Only sources if the brew package is
# installed; absence is not an error (a fresh machine without the
# package still boots cleanly).
#
#   brew install zsh-autosuggestions
_zsh_autosuggest="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -r "$_zsh_autosuggest" ] && source "$_zsh_autosuggest"
unset _zsh_autosuggest
