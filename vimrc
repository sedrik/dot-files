"show the 'ruler' in the status bar, that is always show current location.
set ruler

"Tell us what mode we are currently in =)
set showmode

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

"Expand tabs to 4 spaces, always!
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Use tab for autocompletion
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

"Search during type
set incsearch

"No highlights
set nohlsearch

"I like my searches to be centered when I search
nnoremap  n nzz
nnoremap  N Nzz

"Make backspace behave normal
set backspace=2

"Report allot
set report=0

"Allow nice command prompt
set cmdheight=2

" ==== Spelling ====
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
"Mapping for spelling
nmap <F4> :call ToggleSpell()<CR>
imap <F4> <Esc>:call ToggleSpell()<CR>a
" ==== Spelling ====

"Enable syntax highlighting and some nice filetype associations
syntax enable
filetype on
filetype plugin on
filetype indent on

"This functions stores your state and restores if after issuing the command
"given
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Paste with ctrl+v
"nmap <silent> <C-v> :set paste<CR>"*p:set nopaste<CR>

"Indents the whole file
nmap <leader>= :call Preserve("normal gg=G")<CR>

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"Highlight trailing backspaces
au Syntax * syn match Error /\s\+$/ | syn match Error /^\s* \t\s*/

set fdm=indent

"Make the tab key auto complete.
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"make vim recognmize the mod:fun syntax of erlang
autocmd FileType erlang setlocal iskeyword+=:

" ErlTDD.vim - Fredrik Andersson
" Small script to enable TDD from inside of vim
" Currently only works with environments witch will build all test using make
" test (for example raven).
"
" Invoke with :TDD

"Erlang TDD function
" TODO: Make more general, fit to other languages and test suits
" TODO: Make a separate scripts file for the tests
" TODO: run dialyzer on source code
" TODO: do Test for all open files that are src or test files
command! -complete=file TDD call s:Test()

"TODO: run in background and put output in quickfix window
"autocmd BufWritePost *.erl call s:Test()

function! s:Test()
    let testpath = "-pa test -pa test_hrl"
    let ebinpath = "-pa ebin"
    let libpath = "-pa ../meck/ebin"

    let theFile = expand('%:t:r') 
    if matchstr(theFile, "test_") == "test_"
        let testfile = theFile
    else
        let testfile = "test_" . theFile
    endif

    let paths = testpath . " " . ebinpath . " " . libpath
    let eunit = "eunit:test(" . testfile . ", [verbose])"
    let erlcmd = "-eval 'error_logger:tty(false), " . eunit . ", halt()'"
    let cmd = "!make; make test; erl " . paths .  " " . erlcmd
    execute cmd
    "cexpr system(cmd)
    "echo cmd
endfunction
