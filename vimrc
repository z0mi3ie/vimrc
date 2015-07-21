" Plugin Management {{{1

set autochdir
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree' 
Plugin 'klen/python-mode'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
filetype plugin on

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

execute pathogen#infect()

" }}}
" NERDTree  {{{

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" }}}
" Pymode {{{ 

set foldlevelstart=10
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 120
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 3
let g:pymode_indent = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_rope_autoimport_import_after_complete = 0

" }}}
" TagBar {{{
autocmd vimenter * Tagbar
" }}}
"  Colors {{{

syntax enable

"colorscheme desert
"set background=dark
""let g:solarized_termcolors=256
""set background=dark
""colorscheme solarized

" Set extra options when running in GUI mode
if has("gui_running")
    colorscheme monokai
    set guioptions-=T
    set guioptions-=r
    set guioptions+=e
    set showtabline=0
    set t_Co=256
    set guitablabel=%M\ %t
endif

" }}}
" Tabs {{{

" }}}
" Tabs & Indents {{{

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "Do not wrap lines

" }}}
" Movement {{{

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" }}}
" Python Specific {{{

au! FileType python setl nosmartindent

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" }}}
" Fold Marker {{{ 

" foldmethod=marker
" foldlevel=0
" set modellines=1

" }}}
" Misc. Vim {{{

set history=700
filetype plugin on
filetype indent on
set autoread
let mapleader = ","
let g:mapleader = ","
set noerrorbells
set novisualbell
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set t_vb=
set textwidth=500
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set lbr
set tw=500
set number

" }}}
" Buffers {{{

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" }}}
" Status Line {{{ 
" Always show the status line
set laststatus=2
" }}}



"    _______ _______ _______ _______ _______ _______ 
"   |\     /|\     /|\     /|\     /|\     /|\     /|
"   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
"   | |   | | |   | | |   | | |   | | |   | | |   | |
"   | |.  | | |v  | | |i  | | |m  | | |r  | | |c  | |
"   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
"   |/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|



" vim:foldmethod=marker:foldlevel=0
