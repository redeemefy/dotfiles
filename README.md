# @redeemefy's dotfiles

There are many ways one can manage dotfiles, from individual git repos for each app that uses dotfiles,to version control the $HOME directory and .gitignore everything that doesn't need to be versioned, but I decided to do it with a git bare repo. The reason is that I don't need to create symlinks back to where the OS is expecting the dotfile to be.

```shell
➜ mkdir dotfiles
➜ git init --bare $HOME/dotfiles
➜ vim ~/.oh-my-zsh/custom/dotfiles.zsh
// add this alias 
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
➜ source ~/.zshrc
➜ dotfiles config --local status.showUntrackedFiles no
```

In order to add `~/.oh-my-zsh/custom` to the dotfiles repo, I had to changed `$ZSH_CUSTOM` variable in `~/.zshrc` and move `~/.oh-my-zsh/custom` to `~/.config/ohmyzsh`. 

```shell
➜ mv .oh-my-zsh/custom/* .config/ohmyzsh/custom
➜ vim ~/.zshrc
// modify this line
ZSH_CUSTOM=$HOME/.config/ohmyzsh/custom
➜ dotfiles add .zshrc
➜ dotfiles add ~/.config/ohmyzsh/
➜ dotfiles add ~/.config/lvim/
➜ dotfiles commit -m "Add .zshrc ohmyzsh/custom and lvim"
// assuming I already have a dotfiles repo 
➜ dotfiles push origin dotfiles
```
