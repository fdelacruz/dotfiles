# dotfiles

This repo is a collection of my zsh, vim, and tmux customizations

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
```

* install oh-my-zsh

```
git clone git@github.com:fdelacruz/oh-my-zsh.git .oh-my-zsh
```

* install zaw

```
git clone git@github.com:zsh-users/zaw.git ~/.oh-my-zsh/custom/plugins/zaw
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

* install powerline patched fonts

```
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts
```

## Screenshots
Solarized Light
![Screenshot](https://i.imgur.com/nEvLVoV.png)

Solarized Dark
![Screenshot](https://i.imgur.com/Lkec40R.png)

## LICENSE

Copyright © 2020 Francisco De La Cruz.

This is free software and may be redistributed under the terms specified in the [LICENSE](LICENSE) file.
