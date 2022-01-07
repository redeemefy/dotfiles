#!/bin/bash

export PATH="/Users/redeemefy/.local/bin:$PATH"

# Update LunarVim from any directory
function lvim:update() {
  cd ${HOME}/.local/share/lunarvim/lvim
  git checkout $1
  git -C ${HOME}/.local/share/lunarvim/lvim pull --rebase
}
