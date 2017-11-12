set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" Excellent syntax checker
"Bundle 'scrooloose/syntastic'

" File tree
Bundle 'scrooloose/nerdtree'

" Code completion tool
"Plugin 'Valloric/YouCompleteMe'
Bundle 'w0rp/ale'

" Git integration
Bundle 'tpope/vim-fugitive'

" Fuzzy finding files
Bundle 'kien/ctrlp.vim'

" Snippet engine
Bundle 'SirVer/ultisnips.git'

" Rust highlithing rules
Bundle 'rust-lang/rust.vim.git'

" Rust code completion
Bundle 'ebfe/vim-racer.git'

" Colorscheme used for vimdiff
Bundle 'Lokaltog/vim-distinguished'

" Awesome undo history
Bundle 'sjl/gundo.vim'

" Vim csv
Bundle 'chrisbra/csv.vim'

" EMOJI!!!!
Bundle 'junegunn/vim-emoji'

" Improve javascript syntax
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'

" Autoformat code
Bundle 'sbdchd/neoformat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Vim requires a POSIX shell
set shell=/bin/bash

"Enable syntax highlight
syntax on

" Run formatting on save
let g:ale_fix_on_save = 1

" Make Y be consistent with other capital letter commands
map Y y$

" Use the ron colorscheme
colorscheme ron
" ron works really bad when vimdiff is invoked
if &diff
    colorscheme distinguished
endif
set background=dark

" utf8 ftw!
set encoding=utf8

" leader mapping
let mapleader="§"
let g:mapleader="§"

" Start scrolling before reaching bottom/top
set scrolloff=20

" Show row, column
set ruler

" Allow buffer switching without saving
set hidden

"Ignore case when searching but respect if I search with upper case
set ignorecase
set smartcase

" Make tab-completion behave more sane.
set wildmode=longest,list,full
set wildmenu

" Highlight search things
set hlsearch
" Search as I type
set incsearch

" Use magic regexps by default
set magic

" No sound on errors
set noerrorbells
set novisualbell

"Highlight trailing backspaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au Syntax * syn match ExtraWhitespace /\s\+$/ | syn match ExtraWhitespace /^\s* \t\s*/

"I like my searches to be centered when I search
nnoremap  n nzz
nnoremap  N Nzz

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowritebackup
set noswapfile

" Persistent undo (between sessions)
set undodir=~/.vim/undodir
set undofile

" use 4 spaces instead of tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab

" break long lines (applies when I am editing a line)
set textwidth=99
" Otherwise wrap long lines
set wrap

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?

" Turn of highlight with <leader><enter>
map <silent> <leader><cr> :noh<cr>

" Move between windows using Ctrl+{hjkl}
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quickfix window commands
map <leader>cc :botright copen<cr>
map <leader>n :cnext<cr>
map <leader>p :cprevious<cr>

set spelllang=en
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>s :set spell!<CR>

" Toogle nerdtree view
nnoremap <leader>t :NERDTreeToggle<CR>

" Change dir based on where nerdtree has it's root
let g:NERDTreeChDirMode = 2

" Use python 3 for synstastics
let g:syntastic_python_python_exec = '/usr/bin/python3'
