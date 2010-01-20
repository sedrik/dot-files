"show the 'ruler' in the status bar, that is always show current location.
set ruler

"Tell us what mode we are currently in =)
set showmode

"No auto break line please
set textwidth=0

"Ignore case search
set ignorecase

"Mouse settings, no mouse window focus
set nomousefocus
"Hide mouse when printing
set mousehide
"xterm functionality
set mousemodel=extend

"No ugly bracket jumping matching, DIE EMACS DIE
set noshowmatch

"Expand tabs to 2 spaces, always!
set tabstop=4
set shiftwidth=4
set expandtab

"Use tab for auto completion
set wildchar=<Tab>
"Allow command completion listing
set wildmenu
set wildmode=longest:full,full

"Replace unknown commands with hex values.
set display+=uhex

"Nice indentation
set autoindent

"I don't like auto saving.
set noautowrite

"No wrap around long lines, let them continue
set nowrap

"Search during type
set incsearch

"No highlights
set nohlsearch

"Make backspace behave normal
set backspace=2

"Report allot
set report=0

"Allow nice command prompt
set cmdheight=2

"Spelling =)
":setlocal spell spelllang=en
" Spell check
function! ToggleSpell()
    if !exists("b:spell")
        setlocal spell spelllang=en
        let b:spell = 1
    else
        setlocal nospell
        unlet b:spell
    endif
endfunction

nmap <F4> :call ToggleSpell()<CR>
imap <F4> <Esc>:call ToggleSpell()<CR>a

"Enable syntax highlighting and some nice filetype associations
syntax enable
filetype on
filetype plugin on
filetype indent on

"latex suit
"This plugin provides documentation via vim's help system. To
"view it, use:
" :help latex-suite.txt
" :help latex-suite-quickstart.txt
" :help latexhelp.txt
" :help imaps.txt
set grepprg=grep\ -nH\ $*

" Paste with ctrl+v
nmap <silent> <C-v> :set paste<CR>"*p:set nopaste<CR>

" You can use - to jump between windows
map - <c-w>w

" Nice indenting command
map t mnG=gg:%s/[ \t]*$//g<CR>'nzz

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"Highlight trailing backspaces =)
au Syntax * syn match Error /\s\+$/ | syn match Error /^\s* \t\s*/

:set fdm=indent
