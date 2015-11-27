# dotfiles

This repo is a collection of my zsh, vim, tmux and other customizations 

## Installation

* clone repo to `~/.dotfiles`:

```
cd ~
git clone git@github.com:fdelacruz/dotfiles.git .dotfiles
```

* create symbolic links to config files

```
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/powerline ~/.config
```

* install oh-my-zsh

```
git clone git@github.com:fdelacruz/oh-my-zsh.git .oh-my-zsh
```

* install Vundle

```
mkdir -p .vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
```

* install bundles: open vim and fire command `:PluginInstall`

* in the future: open vim and run `:PluginInstall!` (note the exclamation mark) to download the latest updates to bundles

* to install from command line: `vim +PluginInstall +qall`

* install tmux

```
brew install tmux
```

* install Paul Hinze’s reattach-to-user-namespace to fix copy/paste in vim
  running inside tmux

```
brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
```

**Note:** You need a patched font to be able to use the symbols in the statusline using powerline. You can get them [here](https://github.com/Lokaltog/powerline-fonts). Use OSX's Font Book to install it.

## Screenshot
![Screenshot](http://i.imgur.com/0NftxA3.jpg)

## LICENSE

dotfiles is © 2013-2015 Francisco De La Cruz. It is free software and may be redistributed under the terms specified in the [LICENSE](LICENSE) file.
