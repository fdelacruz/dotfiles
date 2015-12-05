set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'

Plugin 'sjl/gundo.vim'

Plugin 'wookiehangover/jshint.vim'

Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'

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

Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
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

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             BUNDLES - Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
let g:solarized_contrast='normal'
let g:solarized_diffmode='high'                    " Excellent for :Gdiff
let g:solarized_visibility='low'
colorscheme solarized
" Toggle background function
call togglebg#map("<F4>")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POWERLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set laststatus=2
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlPModified
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-textobj-rubyblock
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30
let g:netrw_localrmdir='rm -r'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>A :Ag<SPACE>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-k>"       "Terminal doesn't understand <c-tab>
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jshint
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let JSHintUpdateWriteOnly=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>gvv :Gitv<CR>
nnoremap <space>gvV :Gitv!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sneak
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

hi SneakPluginTarget ctermfg=black ctermbg=red

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easyclip
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-d> <plug>EasyClipSwapPasteBackwards

let g:EasyClipUseSubstituteDefaults = 1
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs p

let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug
