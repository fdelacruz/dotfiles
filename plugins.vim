set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'sheerun/vim-polyglot'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'

Plugin 'sjl/gundo.vim'

Plugin 'dense-analysis/ale'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'

Plugin 'maralla/completor.vim'

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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'mileszs/ack.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'
Plugin 'justinmk/vim-sneak'
Plugin 'svermeulen/vim-easyclip'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}

call vundle#end()
filetype plugin indent on
