# dotfiles

This repo is a collection of my zsh, vim and other customizations 

## Installation

* clone repo to `~/.dotfiles`:

```
cd ~
git clone git@github.com:fdelacruz/dotfiles.git .dotfiles
```

* create symbolic links to config files

```
ls -s .dotfiles/vimrc .vimrc
ls -s .dotfiles/zshrc .zshrc
ls -s .dotfiles/vim .vim
```

* install oh-my-zsh

```
git clone git@github.com:fdelacruz/oh-my-zsh.git .oh-my-zsh
```

* install Vundle

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

* install bundles: open vim and fire command `:BundleInstall`

* in the future: open vim and run `:BundleInstall!` (note the exclamation mark) to download the latest updates to bundles
