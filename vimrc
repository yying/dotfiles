" ***** Pathogen initialization *****
call pathogen#incubate()
call pathogen#helptags()
call pathogen#infect()

" ***** Custom functions *****
function! ToggleCursorColumn()
    if(g:cursorcolumn)
        set nocursorcolumn
        set completeopt=longest,menuone,preview
        let g:cursorcolumn=0
    else
        set cursorcolumn
        set completeopt=longest,menuone
        let g:cursorcolumn=1
    endif
endfunction

function! ToggleLight()
    if (g:islight)
        if has('gui')
            set background=dark
            color solarized
        else
            color distinguished
        endif

        let g:islight=0
    else
        if has('gui')
            color summerfruit256
        else
            color simpleandfriendly
        endif

        let g:islight=1
    endif
endfunction

" ***** Standard options *****
set nocompatible
set backspace=2
set ruler
set number
set wrap
set showcmd
set showmode
set showmatch
set cmdheight=2
set lazyredraw
set nomodeline
set hlsearch
set incsearch
set mouse=nvi
set history=5000

" ***** Disable cursorcolumn by default *****
set nocursorcolumn
set completeopt=longest,menuone,preview
let g:cursorcolumn=0

" ***** GUI Options *****
let g:islight=0

if has('gui')
    set lsp=0
    set guioptions-=T
    
    if has('macunix')
        set guifont=Monaco:h10
    elseif has('win32')
        set guioptions-=m
        set guifont=Lucida_Console:h8
    else
        set guioptions-=m
        set guifont=Terminus\ 8
    endif

    set background=dark
    color solarized
else
    color distinguished
endif

" ***** Syntax highlighting/formatting *****
syntax on
filetype on
filetype indent on
filetype plugin on

" ***** Indent/Tab Options *****
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" ***** Custom Plugin Options *****
let g:tagbar_ctags_bin="e-ctags"

" ***** Custom Keymappings *****
" Map F2 to toggle between light and dark themes
imap <silent> <F2> <ESC>:call ToggleLight()<CR>a
map <silent> <F2> :call ToggleLight()<CR>

" Map F3 to showing a cursor column
imap <silent> <F3> <ESC>:call ToggleCursorColumn()<CR>a
map <silent> <F3> :call ToggleCursorColumn()<CR>

" Map F4 to toggling Tagbar
nmap <F4> :TagbarToggle<CR>

