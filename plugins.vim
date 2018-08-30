set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'

Plugin 'sjl/gundo.vim'

Plugin 'scrooloose/syntastic'

Plugin 'digitaltoad/vim-jade'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-obsession'

Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tommcdo/vim-exchange'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'
Plugin 'justinmk/vim-sneak'
Plugin 'svermeulen/vim-easyclip'
Plugin 'plytophogy/vim-virtualenv'

call vundle#end()
filetype plugin indent on
