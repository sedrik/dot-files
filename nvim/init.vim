"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set nobackup
set nowritebackup
set noswapfile
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

" leader mapping
let mapleader="§"
let g:mapleader="§"

" Move between windows using Ctrl+{hjkl}
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?

" nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
" nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
" nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Turn off highlight with <leader><enter>
map <silent> <leader><cr> :nohlsearch<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/undotree.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/nerdtree.vim

call plug#end()
doautocmd User PlugLoaded

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

" augroup FileTypeOverrides
"     autocmd!
"     " Use '//' instead of '/* */' comments
"     autocmd FileType php setlocal commentstring=//%s
"     autocmd TermOpen * setlocal nospell
" augroup END
