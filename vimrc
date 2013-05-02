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
        if has('gui_running')
            set background=dark
            color solarized
        else
            color distinguished
        endif

        let g:islight=0
    else
        if has('gui_running')
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

if has('gui_running')
    set lsp=0
    set guioptions-=T
    
    if has('macunix')
        set guifont=Monaco:h10
    elseif has('win32')
        set guioptions-=m
        set guifont=Consolas:h10
    else
        set guioptions-=m
        set guifont=Deja\ Vu\ Sans\ Mono\ 8
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

" ***** File Type Specific Options *****
if has("python")
    autocmd FileType python set omnifunc=pythoncomplete#Complete
endif

if has("ruby")
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
endif

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" ***** Custom Plugin Options *****
let g:tagbar_ctags_bin="e-ctags"

" ***** Custom Keymappings *****
" Map Ctrl-Space to Ctrl-x Ctrl-o
" FIXME: this does not work on CLI on Apple Terminal
inoremap <C-space> <C-x><C-o>

" Map F2 to toggle between light and dark themes
imap <silent> <F2> <ESC>:call ToggleLight()<CR>a
map <silent> <F2> :call ToggleLight()<CR>

" Map F3 to showing a cursor column
imap <silent> <F3> <ESC>:call ToggleCursorColumn()<CR>a
map <silent> <F3> :call ToggleCursorColumn()<CR>

" Map F4 to toggling Tagbar
nmap <F4> :TagbarToggle<CR>

