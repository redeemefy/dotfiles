# Prompt with Nerd Font icons + git branch & dirty-state indicator.
#
# Uses zsh's built-in vcs_info (no external deps). Layout:
#   <folder> ~/path | <github> branch<status> ❯
# where <status> is:
#   *  unstaged changes
#   +  staged changes
#   ?  untracked files
# and the git section disappears entirely outside a repo.
#
# Icons use $'\uXXXX' escapes (Nerd Font codepoints) so the source file
# stays ASCII — some tooling strips Private-Use-Area chars when editing.

autoload -Uz vcs_info
autoload -U colors && colors

# Nerd Font glyphs — require a Nerd Font in the active terminal.
local _icon_folder=$''   # nf-fa-folder
local _icon_github=$''   # nf-fa-github
local _icon_arrow=$'❯'    # heavy right angle ❯

# Run vcs_info before each prompt.
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Expand variables/colors inside PROMPT each render.
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats       " %F{8}|%f %F{black}${_icon_github}%f  %F{magenta}%b%f%F{red}%u%c%f"
zstyle ':vcs_info:git:*' actionformats " %F{8}|%f %F{black}${_icon_github}%f  %F{magenta}%b%f %F{yellow}(%a)%f%F{red}%u%c%f"

# Mark untracked files with `?` — vcs_info doesn't do this out of the box.
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] && \
     git status --porcelain 2>/dev/null | grep -q '^??'; then
    hook_com[unstaged]+='?'
  fi
}
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

PROMPT="%F{yellow}${_icon_folder}%f  %F{cyan}%~%f"'${vcs_info_msg_0_}'" %F{green}${_icon_arrow}%f "
