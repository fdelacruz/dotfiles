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
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/vim .vim
ln -s .dotfiles/tmux.conf .tmux.conf
ln -s .dotfiles/tmux-powerlinerc .tmux-powerlinerc
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

* install tmux

```
brew install tmux
```

* install Paul Hinze’s reattach-to-user-namespace to fix copy/paste in vim
  running inside tmux

```
brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
```

* install tmux-powerline

```
git clone git@github.com:fdelacruz/tmux-powerline.git
```
