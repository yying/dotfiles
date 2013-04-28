call pathogen#incubate()
call pathogen#helptags()

set nocompatible
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
set backspace=2
set lsp=0
set tabstop=4
set shiftwidth=4
set expandtab

syntax on

if has('gui')
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
endif

color twilight

let g:cursorcolumn=0

function! ToggleCursorColumn()
    if(g:cursorcolumn)
        set nocursorcolumn
        set completeopt=menuone,preview
        let g:cursorcolumn=0
    else
        set cursorcolumn
        set completeopt=menuone
        let g:cursorcolumn=1
    endif
endfunction

:call ToggleCursorColumn()
