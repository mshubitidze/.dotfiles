set nocompatible
filetype plugin indent on
syntax enable

" plugins
call plug#begin('~/.vim/plugged')

	Plug 'bluz71/vim-moonfly-colors'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'rust-lang/rust.vim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'ryanoasis/vim-devicons'
	Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'preservim/nerdcommenter'
	Plug 'airblade/vim-gitgutter'

call plug#end()

set nu rnu
set numberwidth=5

set encoding=UTF-8

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

xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv

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

let g:lightline = {
	\	'colorscheme': 'moonfly',
	\	'active': {
	\		'left': [ ['mode', 'paste'],
	\				  [ 'readonly', 'filename', 'modified', 'gitstatus' ] ]
	\		},
	\	'component_function': {
	\			'gitstatus': 'GitStatus'
	\		},
	\}


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
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1

lua <<EOF
require('telescope').setup {
	
	defaults = {
		-- default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
			-- map actions.which_key to <c-h> (default: <c-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<c-h>"] = "which_key"
			}
		}
	},

	pickers = {
		-- default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
    	-- }
    	-- Now the picker_config_key will be applied every time you call this
    	-- builtin picker
	},

	extensions = {
		fzf = {
		fuzzy = true,                    -- false will only do exact matching
		override_generic_sorter = true,  -- override the generic sorter
		override_file_sorter = true,     -- override the file sorter
		case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		                                 -- the default case_mode is "smart_case"
		}
	}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require'lspconfig'.pyright.setup{}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
