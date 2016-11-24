
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration
" Kyle Vickers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-endwise'
Plugin 'ap/vim-css-color'
Plugin 'pearofducks/ansible-vim'
Plugin 'chase/nginx.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-obsession'
Plugin 'jistr/vim-nerdtree-tabs'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
filetype plugin on

execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pymode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldlevelstart=10
let g:pymode = 1
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
let g:pymode_options_max_line_length = 79
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 3
let g:pymode_indent = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_rope_autoimport_import_after_complete = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd vimenter * Tagbar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

"colorscheme gruvbox
colorscheme badwolf
"set background=dark

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs & Indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "Do not wrap lines

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType rb setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yml setlocal shiftwidth=2 tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Python Specific
au! FileType python setl nosmartindent

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vanilla Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi vim auto completion settings
let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=1
let g:jedi#use_tabs_not_buffers=0
"let g:jedi#use_splits_not_buffers='<location>'
"   can be set to 'top' 'left' 'right' 'bottom' 'winwidth'
let g:jedi#popup_on_dot=1
let g:jedi#popup_select_first=1
let g:jedi#show_call_signatures=1

" Get rid of doc buffer
autocmd FileType python setlocal completeopt-=preview

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimEnter * IndentGuidesEnable
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"    _______ _______ _______ _______ _______ _______ 
"   |\     /|\     /|\     /|\     /|\     /|\     /|
"   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
"   | |   | | |   | | |   | | |   | | |   | | |   | |
"   | |.  | | |v  | | |i  | | |m  | | |r  | | |c  | |
"   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
"   |/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|

