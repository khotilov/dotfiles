
" fix the backspace key (the was entered as Ctrl-V Backspace in INSERT mode)
" set t_kb=

" remember more history commands (default is 20)
set history=200

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" syntax-highlight doxygen markup
let g:load_doxygen_syntax=1

" use mouse mode
set mouse=a

" functional keys remapping:
map <F2> :w<cr>
map <F8> dd
map <F10> :q<cr>
" re-parse syntax highlighting (useful for big files)
map <F5> :syn sync fromstart<CR>
" F11 to toggle paste mode
map <F11> :set invpaste<CR>
set pastetoggle=<F11>


" Display the match for a search pattern while typing it
set incsearch

" load plugins
filetype plugin on

" We want to keep comments within an 120 column limit, but not code.
" These two options give us that (c=)
setlocal formatoptions=crq
setlocal textwidth=120

" This makes doxygen comments work the same as regular comments
setlocal comments-=://
setlocal comments+=:///,://

" Indents are 2 spaces
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
" And they really are spaces, *not* tabs
setlocal expandtab

" Setup for indending
setlocal nosmartindent
setlocal autoindent
setlocal cinkeys-=0#
setlocal cinoptions+=^
setlocal cinoptions+=g0
setlocal cinoptions+=:0
setlocal cinoptions+=(0

" Highlight strings inside C comments
let c_comment_strings=1

" set laststatus=2 - always show the status line (0 = never, 1 = (default) only if there are >=two windows)
set laststatus=2

:ab #d #define
:ab #i #include
:ab #l /*----------------------------------------------*/

:set sw=2
:set showmatch
:set showfulltag

