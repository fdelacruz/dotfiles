" This file is BASED on Gary Bernhardt's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set shell=/bin/sh

let mapleader=","

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
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tommcdo/vim-exchange'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamed

" Allow unsaved background buffers and remember marks/undo for them
set hidden
" Remember more commands and search history
set history=10000

" Persisted undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Do not store temporary files
set noswapfile
set nobackup
set nowb

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
" Make "tab" insert indents instead of tabs at the beginning of a line
set expandtab
" Always uses spaces instead of tab characters
set smarttab

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\·,trail:·,eol:¬

set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

set showmatch
set incsearch
set hlsearch
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" Highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
set number
set numberwidth=3
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" Change cursor shape in different modes
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
end
" Keep more context when scrolling off the end of a buffer
set scrolloff=3
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Show dollar sign at end of text to be changed.
set cpoptions+=$
" Display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Complete first full match, next match, etc.  (the default)
set wildmode=full
" Command-line completion operates in an enhanced mode
set wildmenu
set dictionary+=/usr/share/dict/words "from Hacking Vim
set mouse=nv "use mouse in normal and visual mode only
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Eliminate delay on ESC
set ttimeoutlen=0
" Turn folding off
set foldmethod=manual
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=79
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " For ruby, autoindent with two spaces, always expand tabs
  autocmd FileType html setlocal ts=2 sw=2 et
  autocmd FileType ruby setlocal ts=2 sw=2 et
  autocmd FileType python setlocal ts=4 sw=4 sts=4 et
  autocmd FileType javascript setlocal ts=2 sw=2 sts=0 noet

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufNewFile,BufRead *.handlebars setfiletype html
  autocmd BufNewFile,BufRead *.ejs setfiletype html

  " Indent p tags
  " autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " Resize splits when the window is resized
  autocmd VimResized * :wincmd =

augroup END

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
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent file
map <Leader>i mmgg=G`m<CR>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Switch between the last two files
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! InsertTabWrapper()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"
"   else
"     return "\<c-p>"
"   endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <up>     <nop>
nnoremap <down>   <nop>
nnoremap <left>   <nop>
nnoremap <right>  <nop>
inoremap <up>     <nop>
inoremap <down>   <nop>
inoremap <left>   <nop>
inoremap <right>  <nop>

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>l :set list!<CR>
