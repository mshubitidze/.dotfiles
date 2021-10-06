set nocompatible
filetype off
syntax enable

" plugins
call plug#begin('~/.vim/plugged')

	" colorscheme
	Plug 'bluz71/vim-moonfly-colors'
	" statusline
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" number
set number
set relativenumber
set numberwidth=6

set laststatus=2
set noshowmode

set clipboard=unnamed

" set a map leader for more key combos
let mapleader = ','

" Tab control
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" swap files
set noswapfile
set nobackup


" indentation
set autoindent
set smartindent

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set cursorline
set shortmess+=I
set lbr
set scrolloff=5
set history=8192

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

set background=dark
colorscheme moonfly

let g:lightline={
	\ 'colorscheme': 'moonfly',
	\ }

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" Position NERDTree on the right
let g:NERDTreeWinPos = "right"

