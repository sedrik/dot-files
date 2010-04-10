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

"No wrap around long lines, let them continue
set nowrap

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

" Nice indenting command
" Obsolete replaced by the two above commands
"map t mnG=gg:%s/[ \t]*$//g<CR>'nzz

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"Highlight trailing backspaces
au Syntax * syn match Error /\s\+$/ | syn match Error /^\s* \t\s*/

:set fdm=indent
