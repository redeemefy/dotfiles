# @redeemefy's dotfiles

There are many ways one can manage dotfiles, from individual git repos for each app that uses dotfiles,to version control the $HOME directory and .gitignore everything that doesn't need to be versioned, but I decided to do it with a git bare repo. The reason is that I don't need to create symlinks back to where the OS is expecting the dotfile to be.

```shell
➜ mkdir dotfiles
➜ git init --bare $HOME/dotfiles
➜ vim ~/.oh-my-zsh/custom/dotfiles.zsh
// add this alias 
➜ alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
➜ source ~/.zshrc
➜ dotfiles config --local status.showUntrackedFiles no
```
